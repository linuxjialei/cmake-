cmake_minimum_required(VERSION 3.16.3)
SET(CMAKE_SYSTEM_NAME Linux) 
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# 指定交叉编译器
#SET(CMAKE_C_COMPILER "/xxx/aarch64-none-linux-gnu-gcc")
#SET(CMAKE_CXX_COMPILER "/xxx/aarch64-none-linux-gnu-g++")

set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}  -Wmissing-prototypes -fno-omit-frame-pointer -fsanitize=address")
set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")
set (CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")

ADD_DEFINITIONS("-g -Wall -Wextra -Wcast-align -Wsign-compare -Wunreachable-code -D_GNU_SOURCE -D__USE_XOPEN -D_XOPEN_SOURCE")
ADD_DEFINITIONS("-DDAS_SELF_REF_TEMP")

# 工程名
project(DEMO_SHOW)

# DEMO_SHOW_BINARY_DIR 为工程目录的build目录下
# 设置编译产生的静态库的路径
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${DEMO_SHOW_BINARY_DIR}/lib)
# 设置编译产生的动态库的路径
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${DEMO_SHOW_BINARY_DIR}/lib)
# 设置编译产生的bin文件路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${DEMO_SHOW_BINARY_DIR}/bin)

# 设置头文件的路径
include_directories(${DEMO_SHOW_SOURCE_DIR}/include)

# 设置连接库的路径
link_directories(${DEMO_SHOW_SOURCE_DIR}/pre_build)
link_directories(${DEMO_SHOW_SOURCE_DIR}/pre_build/npu_lib)
link_directories(${DEMO_SHOW_SOURCE_DIR}/pre_build/console_printf)
link_directories(${DEMO_SHOW_SOURCE_DIR}/pre_build/alsa_lib)

# 此处添加要编译的子目录（目录里是：要编译的app或者库）
add_subdirectory(pre_build)
add_subdirectory(lib_demo)


