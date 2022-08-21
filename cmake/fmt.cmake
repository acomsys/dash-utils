include(FetchContent)

FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG        9.0.0
)
FetchContent_MakeAvailable(fmt)

include_directories(deps/fmt/src/fmt/include)
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt-header-only)