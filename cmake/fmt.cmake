include(FetchContent)

FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG        9.0.0
)

FetchContent_Populate(fmt)

add_subdirectory(build/_deps/fmt-src EXCLUDE_FROM_ALL)