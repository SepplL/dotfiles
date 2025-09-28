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

    try output.writeAll("Input percent of brightness change: ");
    try output.flush();

    const input_line = try read_line(input_buffer, input);
    return std.fmt.parseFloat(number_type, input_line);
}

pub fn main() !void {
    // init general allocator for reading the whole file
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }

    const max_brightness_file = "/sys/class/backlight/intel_backlight/max_brightness";
    const current_brightness_file = "/sys/class/backlight/intel_backlight/brightness";

    // Open the file
    const maxBRfile = try std.fs.cwd().openFile(max_brightness_file, .{});
    defer maxBRfile.close();

    // Read file into buffer
    const maxstat = try maxBRfile.stat();
    const maxbuffer = try maxBRfile.readToEndAlloc(allocator, maxstat.size);
    defer allocator.free(maxbuffer);

    const max_brightness = try std.fmt.parseInt(i32, maxbuffer[0 .. maxbuffer.len - 1], 10);

    const currBRfile = try std.fs.cwd().openFile(current_brightness_file, .{});
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

    const user_input: f32 = try number_input(f32, input_buffer[0..], &stdin.interface, &stdout.interface);

    // try stdout.interface.print("Max Brightness {d}\n", .{max_brightness});
    // try stdout.interface.print("Current Brightness {d}\n", .{current_brightness});
    // try stdout.interface.print("User Input {d}\n", .{user_input});
    try stdout.interface.flush();

    // define minimal birghtness to prevent pitch black screen on accident
    const minimal_brightness: i32 = 250;

    // calculate percentage diff - user input is delta percent for brightness change
    const max_percent: f32 = 100;
    const max_brightness_float: f32 = @floatFromInt(max_brightness);
    const delta_brightness: f32 = @divExact(user_input, max_percent) * max_brightness_float;

    // check for constraints of max and min value
    const new_brightness_delta: i32 = @as(i32, @intFromFloat(delta_brightness));
    var new_brightness: i32 = current_brightness + new_brightness_delta;
    if (new_brightness <= minimal_brightness) {
        new_brightness = minimal_brightness;
    }
    if (new_brightness >= max_brightness) {
        new_brightness = max_brightness;
    }

    // write new brightness to file
    const file = try std.fs.cwd().createFile(
        current_brightness_file,
        .{ .read = true, .truncate = true },
    );
    defer file.close();

    std.debug.print("old brightness value: {d}\n", .{current_brightness});
    std.debug.print("new brightness value: {d}\n", .{new_brightness});
    // try stdout.file.writer(current_brightness_file);
    // stdout.interface.flush();
}

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("brightnessChanger_lib");
