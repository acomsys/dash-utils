include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY  https://github.com/google/googletest.git
  GIT_TAG         release-1.12.1
)

if(WIN32)
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endif()

FetchContent_MakeAvailable(googletest)