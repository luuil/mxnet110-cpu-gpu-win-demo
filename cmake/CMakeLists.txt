if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "
        Error:  In-source builds is not allowed.
                You should create a separate directory for build files.
        ")
endif()

cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)
project(mxnet_win_demo VERSION 0.1.0 LANGUAGES C CXX)

option(USE_CUDA "Build with CUDA support" ON)

# Actual source dir is ..
get_filename_component(proj_SRC_DIR ${mxnet_win_demo_SOURCE_DIR} DIRECTORY)

set(third_party_BIN_DIR "${proj_SRC_DIR}/3rdparty/bin")
set(third_party_LIB_DIR "${proj_SRC_DIR}/3rdparty/lib")

include_directories(
    "${proj_SRC_DIR}/3rdparty/include"
    "${proj_SRC_DIR}/src"
    )

include(util.cmake)
if(USE_CUDA)
    include(example-gpu.cmake)
else(USE_CUDA)
    include(example-cpu.cmake)
endif(USE_CUDA)