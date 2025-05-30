#!/usr/bin/bash

MESON_BUILD_DIR="meson_build"
CMAKE_BUILD_DIR="cmake_build"

rm -rf $MESON_BUILD_DIR $CMAKE_BUILD_DIR

meson setup "${MESON_BUILD_DIR}"
cmake -S "." -B "${CMAKE_BUILD_DIR}"

ninja -C "${MESON_BUILD_DIR}"
cmake --build "${CMAKE_BUILD_DIR}"

diff -w -y {${CMAKE_BUILD_DIR},${MESON_BUILD_DIR}}/test.h

if [ "$?" -eq "0" ]; then
    echo "Output matches"
else
    echo "Output does not match"
fi
