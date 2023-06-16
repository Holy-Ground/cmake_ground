set(TEST_TYPE UNIT)

set(${LIBRARY_NAME}_${TEST_TYPE}_TEST_SOURCES
  utils
  )

include_directories(
  ${${LIBRARY_NAME}_INCLUDE_PATH}
  ${GTEST_INCLUDE_DIR}
  )

add_executable(${LIBRARY_NAME}_${TEST_TYPE}_TESTS
  ${${LIBRARY_NAME}_${TEST_TYPE}_TEST_SOURCES}.cpp
  main.cpp
  )
target_link_libraries(${LIBRARY_NAME}_${TEST_TYPE}_TESTS
  ${GTEST_LIBS}
  ${LIBRARY_NAME}
  )

add_test(NAME ${LIBRARY_NAME}_${TEST_TYPE}_Test COMMAND
  ${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_NAME}_${TEST_TYPE}_TESTS)

set(SLASH "/")
set(UNDER_BAR "_")

foreach (TEST_FILE_NAME ${${LIBRARY_NAME}_${TEST_TYPE}_TEST_SRCS})
  string(REPLACE ${SLASH} ${UNDER_BAR} TEST_NAME ${TEST_FILE_NAME})
  set(TEST_NAME ${LIBRARY_NAME}_${TEST_NAME})

  add_executable(${TEST_NAME}
    main.cpp
    ${TEST_FILE_NAME}.cpp
    )
  target_link_libraries(${TEST_NAME}
    ${GTEST_LIBS}
    ${LIBRARY_NAME}
    )
  add_test(${TEST_NAME}
    ${TEST_NAME}
    --gtest_color=yes
    )
endforeach ()
