message(STATUS "Start configuration for tests.")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

include(find_gtest)
include(CTest)
enable_testing()

file(GLOB ELEMENTS "*")

foreach(ELEMENT ${ELEMENTS})
  if(IS_DIRECTORY ${ELEMENT} AND EXISTS ${ELEMENT}/CMakeLists.txt)
    message("Start configuration for ${ELEMENT}.")
    add_subdirectory(${ELEMENT})
    message("Finish configuration for ${ELEMENT}.")
  endif()
endforeach()

message(STATUS "Finish configuration for tests.\n")
