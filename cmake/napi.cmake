# Includes
include_directories(${CMAKE_JS_INC})

# Libraries
add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES} ${CMAKE_JS_SRC})

# Definitions
add_definitions(-DNAPI_DISABLE_CPP_EXCEPTIONS)
add_definitions(-DNAPI_EXPERIMENTAL)

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
endif()

# Include N-API wrappers
execute_process(COMMAND node -p "require('node-addon-api').include"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE NODE_ADDON_API_DIR
)
string(REPLACE "\n" "" NODE_ADDON_API_DIR ${NODE_ADDON_API_DIR})
string(REPLACE "\"" "" NODE_ADDON_API_DIR ${NODE_ADDON_API_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${NODE_ADDON_API_DIR})