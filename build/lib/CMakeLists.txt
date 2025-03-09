set(PRE_LIB_LIST  ${DUAL_SOURCE_DIR}/pre_build/console_printf/libconsoleprintf.so)
install(FILES ${PRE_LIB_LIST} 
DESTINATION ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})