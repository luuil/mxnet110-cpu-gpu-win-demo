set(example_SRC_DIR "${proj_SRC_DIR}/src/example")

set(third_party_DLLS
    "${third_party_BIN_DIR}/openblas64_0219/libquadmath-0.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libgfortran-3.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libgcc_s_seh-1.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libopenblas.dll"

    "${third_party_BIN_DIR}/opencv64_341/opencv_world341.dll"

    "${third_party_BIN_DIR}/cuda64_80/nvcuda.dll"
    "${third_party_BIN_DIR}/cuda64_80/nvrtc64_80.dll"
    "${third_party_BIN_DIR}/cuda64_80/cufft64_80.dll"
    "${third_party_BIN_DIR}/cuda64_80/curand64_80.dll"
    "${third_party_BIN_DIR}/cuda64_80/cusolver64_80.dll"
    "${third_party_BIN_DIR}/cuda64_80/cublas64_80.dll"
    )

set(third_party_LIBRARIES
    "${third_party_LIB_DIR}/mxnet64_110/libmxnet-gpu110.lib"
    "${third_party_LIB_DIR}/opencv64_341/opencv_world341.lib"
    )

add_executable(mlp_gpu ${example_SRC_DIR}/mlp_gpu.cpp)
target_link_libraries(mlp_gpu ${third_party_LIBRARIES})
copy_files_if_different(mlp_gpu third_party_DLLS)
copy_rename_file_if_different(mlp_gpu "${third_party_BIN_DIR}/mxnet64_110/libmxnet-gpu110.dll" "libmxnet.dll")

add_executable(lenet_with_mxdataiter ${example_SRC_DIR}/lenet_with_mxdataiter.cpp)
target_link_libraries(lenet_with_mxdataiter ${third_party_LIBRARIES})
copy_files_if_different(lenet_with_mxdataiter third_party_DLLS)
copy_rename_file_if_different(lenet_with_mxdataiter "${third_party_BIN_DIR}/mxnet64_110/libmxnet-gpu110.dll" "libmxnet.dll")

add_executable(image-classification-predict ${example_SRC_DIR}/image-classification-predict.cc)
target_link_libraries(image-classification-predict ${third_party_LIBRARIES})
copy_files_if_different(image-classification-predict third_party_DLLS)
copy_rename_file_if_different(image-classification-predict "${third_party_BIN_DIR}/mxnet64_110/libmxnet-gpu110.dll" "libmxnet.dll")

# add_executable(lenet ${example_SRC_DIR}/lenet.cpp)
# target_link_libraries(lenet ${third_party_LIBRARIES})
# copy_files_if_different(lenet third_party_DLLS)
# copy_rename_file_if_different(lenet "${third_party_BIN_DIR}/mxnet/libmxnet-gpu110.dll" "libmxnet.dll")

# add_executable(alexnet alexnet.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(alexnet ${CPP_EXAMPLE_LIBS})
# add_dependencies(alexnet ${CPPEX_DEPS})

# add_executable(charRNN charRNN.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(charRNN ${CPP_EXAMPLE_LIBS})
# add_dependencies(charRNN ${CPPEX_DEPS})

# add_executable(googlenet googlenet.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(googlenet ${CPP_EXAMPLE_LIBS})
# add_dependencies(googlenet ${CPPEX_DEPS})

# add_executable(inception_bn inception_bn.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(inception_bn ${CPP_EXAMPLE_LIBS})
# add_dependencies(inception_bn ${CPPEX_DEPS})

# add_executable(mlp mlp.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(mlp ${CPP_EXAMPLE_LIBS})
# add_dependencies(mlp ${CPPEX_DEPS})

# add_executable(mlp_cpu mlp_cpu.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(mlp_cpu ${CPP_EXAMPLE_LIBS})
# add_dependencies(mlp_cpu ${CPPEX_DEPS})

# add_executable(mlp_gpu mlp_gpu.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(mlp_gpu ${CPP_EXAMPLE_LIBS})
# add_dependencies(mlp_gpu ${CPPEX_DEPS})

# add_executable(resnet resnet.cpp ${CPP_PACKAGE_HEADERS})
# target_link_libraries(resnet ${CPP_EXAMPLE_LIBS})
# add_dependencies(resnet ${CPPEX_DEPS})