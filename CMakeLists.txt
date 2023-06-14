cmake_minimum_required(VERSION 3.12)

project(test LANGUAGES C)

set(foo ON)
set(HAVE_FOO foo_content)
set(bar "test")
set(barfalse OFF)
set(barzero 0)
set(barint 22)
set(foobar "value")
set(barfoo OFF)
set(nofoo)

configure_file(
    test.h.cmake
    test.h
)
