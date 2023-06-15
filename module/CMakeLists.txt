message(STATUS "Start configuration for submodules.")

file(GLOB ELEMENTS "*")

foreach(ELEMENT ${ELEMENTS})
  if(IS_DIRECTORY ${ELEMENT} AND EXISTS ${ELEMENT}/CMakeLists.txt)
    message("Start configuration for ${ELEMENT}.")
    add_subdirectory(${ELEMENT})
    message("Finish configuration for ${ELEMENT}.")
  endif()
endforeach()

message(STATUS "Finish configuration for submodules.\n")
