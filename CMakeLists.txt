cmake_minimum_required(VERSION 3.0.0)

set(PACKAGE_NAME CMAKE_GROUND)
set(PACKAGE_VERSION 0.1.1)

project(PACKAGE_NAME)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

set(${PACKAGE_NAME}_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(${PACKAGE_NAME}_SOURCE_PATH "${${PACKAGE_NAME}_PATH}/src")
set(${PACKAGE_NAME}_INCLUDE_PATH "${${PACKAGE_NAME}_PATH}/include")
set(${PACKAGE_NAME}_TEST_PATH "${${PACKAGE_NAME}_PATH}/test")
set(${PACKAGE_NAME}_RESOURCE_PATH "${${PACKAGE_NAME}_PATH}/resource")
set(${PACKAGE_NAME}_MODULE_PATH "${${PACKAGE_NAME}_PATH}/module")

function(get_subdirectories RESULT INPUT_FOLDER_NAME)
  file(GLOB ELEMENTS RELATIVE ${INPUT_FOLDER_NAME} ${INPUT_FOLDER_NAME}/*)
  set(FOLDER_LIST "")
  foreach(ELEMENT ${ELEMENTS})
    if(IS_DIRECTORY ${INPUT_FOLDER_NAME}/${ELEMENT})
      list(APPEND FOLDER_LIST ${ELEMENT})
    endif()
  endforeach()
  set(${RESULT} ${FOLDER_LIST} PARENT_SCOPE)
endfunction()

get_subdirectories(SUB_MODULES ${${PACKAGE_NAME}_MODULE_PATH})

foreach(MODULE ${SUB_MODULES})
  message("Sub module: ${MODULE}")
  add_subdirectory("${${PACKAGE_NAME}_MODULE_PATH}/${MODULE}")
endforeach()

add_executable(main src/main.cpp)
target_link_libraries(main
  CMAKE_GROUND_EXAMPLE
)
target_include_directories(main PUBLIC
  ${${PACKAGE_NAME}_INCLUDE_PATH}
)
target_compile_options(main PRIVATE
  -Wall -Wextra -Wpedantic -Werror
)
