#!/usr/bin/bash

CMAKE_BUILD_DIR="cmake_build"
ZIG_CACHE_DIR="zig-cache"

rm -rf $CMAKE_BUILD_DIR $ZIG_CACHE_DIR

cmake -S "." -B "${CMAKE_BUILD_DIR}"
cmake --build "${CMAKE_BUILD_DIR}"

# The header will be placed in the zig cache and we cannot anticipate
# where exactly that will be so comparisons are handled in build.zig
zig build test --verbose
