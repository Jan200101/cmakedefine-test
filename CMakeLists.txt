cmake_minimum_required(VERSION 3.12)

project(test LANGUAGES C)

set(noval)
set(nullval)
set(trueval 1)
set(falseval 0)
set(zeroval 0)
set(oneval 1)
set(tenval 10)
set(stringval "test")

set(boolnoval)
set(boolnullval)
set(booltrueval 1)
set(boolfalseval 0)
set(boolzeroval 0)
set(booloneval 1)
set(booltenval 10)
set(boolstringval "test")

configure_file(
    test.h.cmake
    test.h
)
