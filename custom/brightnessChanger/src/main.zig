//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.

const std = @import("std");

fn read_line(line_buffer: []u8, input: *std.Io.Reader) ![]u8 {
    var w: std.Io.Writer = .fixed(line_buffer);

    // var for windows -> search and fix for \r, but does not apply here.
    const line_length = try input.streamDelimiterLimit(&w, '\n', .unlimited);
    std.debug.assert(line_length <= line_buffer.len);

    return line_buffer[0..line_length];
}

fn number_input(comptime number_type: type, input_buffer: []u8, input: *std.Io.Reader, output: *std.Io.Writer) !number_type {

    try output.writeAll("A number please: ");
    try output.flush();

    const input_line = try read_line(input_buffer, input);
    return std.fmt.parseInt(number_type, input_line, 10);
}

pub fn main() !void {
    // init general allocator for reading the whole file
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }

    // Open the file
    const maxBRfile = try std.fs.cwd().openFile("/sys/class/backlight/intel_backlight/max_brightness", .{});
    defer maxBRfile.close();

    // Read file into buffer
    const maxstat = try maxBRfile.stat();
    const maxbuffer = try maxBRfile.readToEndAlloc(allocator, maxstat.size);
    defer allocator.free(maxbuffer);

    const max_brightness = try std.fmt.parseInt(i32, maxbuffer[0 .. maxbuffer.len - 1], 10);

    const currBRfile = try std.fs.cwd().openFile("/sys/class/backlight/intel_backlight/brightness", .{});
    defer currBRfile.close();

    // Read file into buffer
    const currstat = try currBRfile.stat();
    const currbuffer = try currBRfile.readToEndAlloc(allocator, currstat.size);
    defer allocator.free(currbuffer);

    const current_brightness = try std.fmt.parseInt(i32, currbuffer[0 .. currbuffer.len - 1], 10);

    // get user input for brightness adjustment
    var input_buffer: [1024]u8 = undefined;
    var output_buffer: [1024]u8 = undefined;
    var stdin = std.fs.File.stdin().reader(&input_buffer);
    var stdout = std.fs.File.stdout().writer(&output_buffer);

    const user_input: i32 = try number_input(i32, input_buffer[0..], &stdin.interface, &stdout.interface);

    try stdout.interface.print("Max Brightness {d}\n", .{max_brightness});
    try stdout.interface.print("Current Brightness {d}\n", .{current_brightness});
    try stdout.interface.print("User Input {d}\n", .{user_input});

    try stdout.interface.flush();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test "fuzz example" {
    const Context = struct {
        fn testOne(context: @This(), input: []const u8) anyerror!void {
            _ = context;
            // Try passing `--fuzz` to `zig build test` and see if it manages to fail this test case!
            try std.testing.expect(!std.mem.eql(u8, "canyoufindme", input));
        }
    };
    try std.testing.fuzz(Context{}, Context.testOne, .{});
}

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("brightnessChanger_lib");
