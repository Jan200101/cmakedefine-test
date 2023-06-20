const std = @import("std");

pub fn build(b: *std.Build) void {
    const config_header = b.addConfigHeader(
        .{
            .style = .{ .cmake = .{ .path = "test.h.cmake" } },
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
        },
    );

    const test_step = b.step("configure", "configure the header");
    test_step.dependOn(&config_header.step);
}
