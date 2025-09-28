//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.

const std = @import("std");

fn number_input(comptime number_type: type) !number_type {
    var buf: [1024]u8 = undefined;
    // var stdout = std.fs.File.stdout().writerStreaming(&.{});
    var stdout = std.fs.File.stdout().writerStreaming(&buf);
    // faster with &buf -> buffer read/write calls and execute them grouped to reduce sys
    // calls. This is a quick and dirty test
    var in = std.fs.File.stdin().readerStreaming(&buf);
    var bufUntilEofReader = std.Io.Reader.defaultReadVec(&in);
    const reader = &bufUntilEofReader.interface;

    try stdout.interface.print("A number please: ", .{});

    if (try reader(buf[0..], '\n')) |user_input| {
        return std.fmt.parseInt(number_type, user_input, 10);
    } else {
        return @as(number_type, 0);
    }
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

    const user_input: i32 = try number_input(i32);

    std.debug.print("Max Brightness {d}\n", .{max_brightness});
    std.debug.print("Current Brightness {d}\n", .{current_brightness});
    std.debug.print("User Input {d}\n", .{user_input});
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
