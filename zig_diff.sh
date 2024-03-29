#!/usr/bin/bash

CMAKE_BUILD_DIR="cmake_build"
ZIG_CACHE_DIR="zig-cache"

rm -rf $CMAKE_BUILD_DIR $ZIG_CACHE_DIR

cmake -S "." -B "${CMAKE_BUILD_DIR}"
cmake --build "${CMAKE_BUILD_DIR}"

zig build test
