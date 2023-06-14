const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const config_header = b.addConfigHeader(
        .{
            .style = .{ .cmake = .{ .path = "test.h.cmake" } },
        },
        .{
            .foo = true,
            .HAVE_FOO = "foo_content",
            .bar = "test",
            .barfalse = false,
            .barzero = 0,
            .barint = 22,
            .foobar = "value",
            .barfoo = false,
            .unbar = null,
            .nofoo = void{},
        },
    );

    const run_step = b.step("configure", "configure the relevant headers");
    run_step.dependOn(&config_header.step);
}
