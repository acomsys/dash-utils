# dash-utils

This is the experimental demonstrator for building native C++ addon modules to NodeJS for optimization of some utility functions required by the dash project.

## Dependencies

1. CMake 3.24.1
1. Ninja 1.11.0
1. Python 3.10
1. Node 18.7.0
1. C/C++ Build Tools (will vary depending on OS)

# Concepts

This project aims to study the optimization of certain nodejs functions by using C/C++ bindings on NodeJS (server side) and WASM on the browser (client side).

## Node API

Please make sure to read on [Node-API](https://nodejs.github.io/node-addon-examples/). There is also a good getting started guide without using yoman from here, [Node-API Setup](https://github.com/nodejs/node-addon-api/blob/main/doc/setup.md).

**Important!**, we are using [`cmake-js`](https://nodejs.github.io/node-addon-examples/build-tools/cmake-js/) to run builds. This is so we can take advantage of the rich dependency management capabilities of cmake.

## Exception Handling

In this project, C++ Exceptions will be enabled. This means that the C++ code will be wrapped in a try/catch block. Thrown exceptions will be caught at NodeJS layer. Read more form here for the details, [Node API Exception Handling](https://github.com/nodejs/node-addon-api/blob/HEAD/doc/error_handling.md#examples-with-c-exceptions-enabled).

## VSCode

Make sure to setup dependencies according to [prebuild](https://github.com/prebuild/prebuild#prebuild) and [cmake-js](https://nodejs.github.io/node-addon-examples/build-tools/cmake-js) requirements.

In addition to that, there are a few more environment variables that needs to be set.

1. `NODE_HOME` 

    Windows: `%APPDATA%\..\Local\node-gyp\Cache\16.15.0\include\node`

    Mac OS: `$HOME/Library/Caches/node-gyp/18.7.0/include/node`