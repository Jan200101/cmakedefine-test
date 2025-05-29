const std = @import("std");
const ConfigHeader = std.Build.Step.ConfigHeader;

const Build = std.Build;
const Step = Build.Step;
const RunError = Build.RunError;
const assert = std.debug.assert;
const process = std.process;

pub fn build(b: *Build) void {
    const config_header = b.addConfigHeader(
        .{
            .style = .{ .cmake = b.path("test.h.cmake") },
            .include_path = "cmake_build/test.h",
        },
        .{
            .noval = null,
            .trueval = true,
            .falseval = false,
            .zeroval = 0,
            .oneval = 1,
            .tenval = 10,
            .stringval = "test",

            .boolnoval = void{},
            .booltrueval = true,
            .boolfalseval = false,
            .boolzeroval = 0,
            .booloneval = 1,
            .booltenval = 10,
            .boolstringval = "test",

            .DOLLAR = "$",
            .TEXT = "TRAP",
            .STRING = "TEXT",
            .STRING_AT = "@STRING@",
            .STRING_CURLY = "{STRING}",
            .STRING_VAR = "${STRING}",

            .UNDERSCORE = "_",
            .NEST_UNDERSCORE_PROXY = "UNDERSCORE",
            .NEST_PROXY = "NEST_UNDERSCORE_PROXY",
        },
    );

    const test_step = b.step("test", "configure and compare the header");
    test_step.makeFn = compare_headers;
    test_step.dependOn(&config_header.step);
}

pub fn run(
    b: *Build,
    argv: []const []const u8,
    out_code: *u8,
    stderr_behavior: std.process.Child.StdIo,
) RunError![]u8 {
    assert(argv.len != 0);

    if (!process.can_spawn)
        return error.ExecNotSupported;

    const max_output_size = 400 * 1024;
    var child = std.process.Child.init(argv, b.allocator);
    child.stdin_behavior = .Ignore;
    child.stdout_behavior = .Pipe;
    child.stderr_behavior = stderr_behavior;
    child.env_map = &b.graph.env_map;

    try Step.handleVerbose2(b, null, child.env_map, argv);
    try child.spawn();

    const stdout = child.stdout.?.reader().readAllAlloc(b.allocator, max_output_size) catch {
        return error.ReadFailure;
    };
    errdefer b.allocator.free(stdout);

    const term = try child.wait();
    switch (term) {
        .Exited => |code| {
            out_code.* = @as(u8, @truncate(code));
            return stdout;
        },
        .Signal, .Stopped, .Unknown => |code| {
            out_code.* = @as(u8, @truncate(code));
            return error.ProcessTerminated;
        },
    }
}

fn compare_headers(step: *std.Build.Step, options: std.Build.Step.MakeOptions) !void {
    _ = options;
    const b = step.owner;

    for (step.dependencies.items) |config_header_step| {
        const config_header: *ConfigHeader = @fieldParentPtr("step", config_header_step);

        const zig_header_path = config_header.output_file.path orelse @panic("Could not locate header file");

        var code: u8 = undefined;
        const output = try run(
            b,
            &.{
                "diff",
                "-w",
                "-y",
                config_header.include_path,
                zig_header_path,
            },
            &code,
            .Ignore,
        );
        std.debug.print("{s}\n", .{output});

        if (code == 0) {
            std.debug.print("Output matches", .{});
        } else {
            std.debug.print("Output does not match", .{});
        }
    }
}
