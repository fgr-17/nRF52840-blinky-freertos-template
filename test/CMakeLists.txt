set(TEST_NAME test_suite)

set(LIB_DIR lib)
set(FAKEIT_DIR FakeIt)

include_directories(
  ${CMAKE_SOURCE_DIR}/lib/FakeIt
)
  
  # target_sources(${TEST_NAME}
  #   PRIVATE
  #     main_test.cpp
  #     basic.cpp
  #     doubles/bsp.cpp
  #     doubles/FreeRTOS.c
  #     ${CMAKE_SOURCE_DIR}/${SRC_DIR}/led/led.cpp
  #   )
  
set(Sources 
  main_test.cpp
  basic_test.cpp
  led_test.cpp
)
  
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "${dir}")
endforeach()


add_executable(${TEST_NAME} ${Sources})

target_link_libraries(${TEST_NAME}
  PUBLIC
  ::Catch2
  # source_test
  )

add_test(
NAME
  "${TEST_NAME}"
COMMAND
  ${TEST_NAME}
)