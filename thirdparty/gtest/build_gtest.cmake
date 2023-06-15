message(STATUS "Start configuration for GTEST.")

find_package(GTEST QUIET HINTS ${GTEST_INSTALL_PATH}/lib/cmake/GTEST)

if(GTest_FOUND)
  message(STATUS "Found GTest.")
else()
  message(STATUS "Not found GTest! Using ExternalProject.")
  ExternalProject_Add(
    GTEST
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.8.1
    PREFIX ${CMAKE_BINARY_DIR}/gtest-prefix
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/install/${CMAKE_BUILD_TYPE}
  )
endif()

set(GTEST_INCLUDE_PATH ${GTEST_INSTALL_DIR}/include)
set(GTEST_LIBS GTest::gtest)
include_directories(${GTEST_INCLUDE_PATH})

message(STATUS "Finish configuration for GTest.\n")
