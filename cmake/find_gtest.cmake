message(STATUS "Start Finding GTest.")

set(GTEST_INSTALL_PATH ${CMAKE_BINARY_DIR}/thirdparty/gtest/install/${CMAKE_BUILD_TYPE})

find_package(GTest QUIET HINTS ${GTEST_INSTALL_PATH}/lib/cmake/GTest)

if(GTest_FOUND)
  message(STATUS "Found GTest.")

  set(GTEST_INCLUDE_PATH ${GTEST_INSTALL_PATH}/include)
  set(GTEST_LIBS GTest::gtest)
  include_directories(${GTEST_INCLUDE_PATH})
endif()

message(STATUS "Finish Finding GTest.\n")
