const std = @import("std");
const ConfigHeader = std.Build.Step.ConfigHeader;

pub fn build(b: *std.Build) void {
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

            // zig require all variables to be defined since 0.15
            .undefval = null,
        },
    );

    const test_step = b.step("test", "Test it");
    b.default_step = test_step;
    test_step.dependOn(addCheck(b, config_header));
}

fn addCheck(
    b: *std.Build,
    ch: *ConfigHeader,
) *std.Build.Step {
    const expected_path = ch.include_path;

    const run_check = b.addSystemCommand(&.{ "diff", "-u", "-I", "generated" });
    run_check.addFileArg(ch.getOutputFile());
    run_check.addFileArg(b.path(expected_path));

    return &run_check.step;
}
