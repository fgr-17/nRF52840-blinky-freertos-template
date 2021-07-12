cmake_minimum_required(VERSION 3.8)

set(This ExampleTests)

set(Sources
    ExampleTests.cpp
    doubles/bsp.cpp
    doubles/FreeRTOS.c
)

add_executable(${This}  ${Sources})

# message(WARNING "${CMAKE_CURRENT_SOURCE_DIR}")
# message(WARNING "${CMAKE_SOURCE_DIR}/${SRC_DIR}/led ")
include_directories(
  ${CMAKE_SOURCE_DIR}/ext/gmock-global/include
)

# get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
# foreach(dir ${dirs})
#   message(STATUS "${dir}")
# endforeach()

# enable_testing()

target_link_libraries(${This} PUBLIC
    # gtest_main
    gmock_main
    Example
)

# add_test(
#     NAME ${This}
#     COMMAND ${This}
# )