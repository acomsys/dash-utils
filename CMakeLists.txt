cmake_minimum_required(VERSION 3.23.2)
cmake_policy(SET CMP0042 NEW)
set (CMAKE_CXX_STANDARD 23)
set (CXX_STANDARD_REQUIRED true)

add_compile_definitions(NAPI_VERSION=8)

# Name of the project (will be the name of the plugin)
project (dash_utils)

# Build a shared library named after the project from the files in `src/`
file( GLOB SOURCE_FILES 
    "src/native/module.cc"
    "src/native/greeter/greeter.cc"
    "src/native/hello/hello.cc"
)

# Dependencies
include(./cmake/napi.cmake)
include(./cmake/fmt.cmake)
include(./cmake/gtest.cmake)

# Gives our library file a .node extension without any "lib" prefix
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".node")

# You should add this line in every CMake.js based project
target_link_libraries(${PROJECT_NAME} PRIVATE ${CMAKE_JS_LIB})

# Enable testing
enable_testing()

add_executable(
  hello_test
  src/native/hello/hello_test.cc
)
target_link_libraries(
  hello_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(hello_test)