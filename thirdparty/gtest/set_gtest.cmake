message(STATUS "Start configuration for GTest.")

set(GTEST_INSTALL_PATH ${CMAKE_BINARY_DIR}/thirdparty/gtest/install/${CMAKE_BUILD_TYPE})

find_package(GTest QUIET HINTS ${GTEST_INSTALL_PATH}/lib/cmake/GTest)
message(STATUS ${GTEST_INSTALL_PATH})
if(GTest_FOUND)
  message(STATUS "Found GTest.")
else()
  message(STATUS "Not found GTest! Using ExternalProject.")
  ExternalProject_Add(
    GTEST
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1
    PREFIX ${CMAKE_BINARY_DIR}/gtest-prefix
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/install/${CMAKE_BUILD_TYPE}
  )
endif()

message(STATUS "Finish configuration for GTest.\n")
