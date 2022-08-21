cmake_minimum_required(VERSION 3.24.1)
cmake_policy(SET CMP0042 NEW)
set (CMAKE_CXX_STANDARD 23)
set (CXX_STANDARD_REQUIRED true)

add_compile_definitions(NAPI_VERSION=8)

# Name of the project (will be the name of the plugin)
project (dash_utils)

# Roots
include_directories(${CMAKE_JS_INC})

# Build a shared library named after the project from the files in `src/`
file( GLOB SOURCE_FILES 
    "src/native/module.cc",
    "src/native/greeter/greeter.cc",
    "src/native/hello/hello.cc",
)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES} ${CMAKE_JS_SRC})

# Gives our library file a .node extension without any "lib" prefix
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".node")


# Set attributes
if(WIN32)
    add_definitions(-D_HAS_EXCEPTIONS=1 )
elseif(APPLE)
    set_target_properties(${PROJECT_NAME} PROPERTIES 
        XCODE_ATTRIBUTE_GCC_ENABLE_CPP_EXCEPTIONS "YES"
        XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++"
        XCODE_ATTRIBUTE_MACOSX_DEPLOYMENT_TARGET "10.7"
        XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN "YES"
    )

    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fvisibility=hidden")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden")
elseif(UNIX)
    message("https://cmake.org/cmake/help/latest/variable/UNIX.html?highlight=unix")
endif()

# You should add this line in every CMake.js based project
target_link_libraries(${PROJECT_NAME} ${CMAKE_JS_LIB})

# Include N-API wrappers
execute_process(COMMAND node -p "require('node-addon-api').include"
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE NODE_ADDON_API_DIR
        )
string(REPLACE "\n" "" NODE_ADDON_API_DIR ${NODE_ADDON_API_DIR})
string(REPLACE "\"" "" NODE_ADDON_API_DIR ${NODE_ADDON_API_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${NODE_ADDON_API_DIR})

# Definitions
add_definitions(-DNAPI_DISABLE_CPP_EXCEPTIONS)
add_definitions(-DNAPI_EXPERIMENTAL)