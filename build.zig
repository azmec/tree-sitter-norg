const std = @import("std");

pub fn build(b: *std.Build) void {
    var obj = b.addStaticLibrary(.{
        .name = "tree-sitter-norg",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });

    obj.linkLibC();
    obj.linkSystemLibrary("c++");
    obj.addCSourceFile(.{ .file = .{ .path = "src/parser.c" }, .flags = &.{} });
    obj.addCSourceFile(.{ .file = .{ .path = "src/scanner.cc" }, .flags = &.{} });
    obj.addIncludePath(.{ .path = "src" });

    b.installArtifact(obj);
}
