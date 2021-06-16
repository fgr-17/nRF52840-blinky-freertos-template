cmake_minimum_required(VERSION 3.8)

set(This Example)

project(${This} C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_subdirectory(ext/googletest)

set(INC_DIR 
    src/led
    test/doubles/
)

include_directories(${INC_DIR})

set(Sources
    src/led/led.cpp
)

add_library(${This} STATIC ${Sources})

add_subdirectory(test)