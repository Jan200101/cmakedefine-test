cmake_minimum_required(VERSION 3.12)

project(test LANGUAGES C)

set(foo ON)
set(HAVE_FOO foo_content)
set(bar "test")
set(foobar "value")
set(barfoo OFF)

configure_file(
    test.h.cmake
    test.h
)
