# 把这几个线程的库复制到 CMAKE_LIBRARY_OUTPUT_DIRECTORY 目录下
set(PRE_LIB_LIST 
${DUAL_SOURCE_DIR}/pre_build/alsa/libasound.so
${DUAL_SOURCE_DIR}/pre_build/alsa/libasound.so.2
${DUAL_SOURCE_DIR}/pre_build/alsa/libasound.so.2.0.0
${DUAL_SOURCE_DIR}/pre_build/alsa/libatopology.so
${DUAL_SOURCE_DIR}/pre_build/alsa/libatopology.so.2
${DUAL_SOURCE_DIR}/pre_build/alsa/libatopology.so.2.0.0
)
install(FILES ${PRE_LIB_LIST} 
DESTINATION ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
