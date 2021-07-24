set(TEST_NAME basic_test)

add_executable(${TEST_NAME})

target_sources(${TEST_NAME}
PRIVATE
  test.cpp
)

target_link_libraries(${TEST_NAME}
PRIVATE
  # $<TARGET_OBJECTS:helloworld>
  ::Catch2
)

add_test(
NAME
  "basic_test"
COMMAND
  ${TEST_NAME}
)