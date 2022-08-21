cmake_minimum_required(VERSION 3.23.2)
cmake_policy(SET CMP0042 NEW)
set (CMAKE_CXX_STANDARD 23)
set (CXX_STANDARD_REQUIRED true)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/Release)

add_compile_definitions(NAPI_VERSION=8)

# Name of the project (will be the name of the plugin)
project (dash_utils)

# Dependencies
include(./cmake/napi.cmake)
include(./cmake/gtest.cmake)
include(./cmake/fmt.cmake)

# Build a shared library named after the project from the files in `src/`
file( GLOB SOURCE_FILES 
  src/native/module.cc
  src/native/greeter/greeter.cc
  src/native/hello/hello.cc
)

# Libraries
add_library(${PROJECT_NAME} SHARED
  ${SOURCE_FILES} 
  ${CMAKE_JS_SRC}
)

# Target Properties
if(APPLE)
  set_target_properties(${PROJECT_NAME} PROPERTIES 
    PREFIX "" 
    SUFFIX ".node"
    VERSION ${NODE_VERSION}
    SOVERSION ${NODE_VERSION}
    PROJECT_LABEL ${PROJECT_NAME}
    XCODE_ATTRIBUTE_GCC_ENABLE_CPP_EXCEPTIONS "YES"
    XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++"
    XCODE_ATTRIBUTE_MACOSX_DEPLOYMENT_TARGET "10.7"
    XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN "YES"
  )
elseif(WIN32)
  set_target_properties(${PROJECT_NAME} PROPERTIES 
    PREFIX "" 
    SUFFIX ".node"
    VERSION ${NODE_VERSION}
    SOVERSION ${NODE_VERSION}
    PROJECT_LABEL ${PROJECT_NAME}
  )
elseif(UNIX)
  set_target_properties(${PROJECT_NAME} PROPERTIES 
    PREFIX "" 
    SUFFIX ".node"
    PROJECT_LABEL ${PROJECT_NAME}
    XCODE_ATTRIBUTE_GCC_ENABLE_CPP_EXCEPTIONS "YES"
    XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++"
    XCODE_ATTRIBUTE_MACOSX_DEPLOYMENT_TARGET "10.7"
    XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN "YES"
  )
endif()

# You should add this line in every CMake.js based project
target_link_libraries(${PROJECT_NAME} ${CMAKE_JS_LIB})

# Include
target_include_directories(${PROJECT_NAME} PRIVATE
  ${CMAKE_JS_INC}
  ${NODE_ADDON_API_DIR}
  "build/_deps/fmt-src/include"
)

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