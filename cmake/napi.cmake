# Definitions
add_definitions(-DNAPI_VERSION=8)
add_definitions(-DNAPI_DISABLE_CPP_EXCEPTIONS)
add_definitions(-DNAPI_EXPERIMENTAL)

# Set attributes
if(WIN32)
    add_definitions(-D_HAS_EXCEPTIONS=1 )
elseif(APPLE)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fvisibility=hidden")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden")
endif()

# Get NODE_ADDON_API_DIR
execute_process(COMMAND node -p "require('node-addon-api').include"
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE NODE_ADDON_API_DIR
        )
string(REGEX REPLACE "[\r\n\"]" "" NODE_ADDON_API_DIR ${NODE_ADDON_API_DIR})

# Node NODE_VERSION
execute_process(COMMAND node -p "require('./package.json').version"
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE NODE_VERSION
        )
string(REGEX REPLACE "[\r\n\"]" "" NODE_VERSION ${NODE_VERSION})