message(STATUS "Start Finding GTest.")

find_package(GTEST QUIET HINTS ${GTEST_INSTALL_DIR}/lib/cmake/GTEST)

if(GTest_FOUND)
  message(STATUS "Found GTest.")

  set(GTEST_INCLUDE_DIR ${GTEST_INSTALL_DIR}/include)
  set(GTEST_LIBS GTest::gtest)
  include_directories(${GTEST_INCLUDE_DIR})
endif()

message(STATUS "Finish Finding GTest.\n")
