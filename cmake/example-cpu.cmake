set(example_SRC_DIR "${proj_SRC_DIR}/src/example")

set(third_party_DLLS
    "${third_party_BIN_DIR}/openblas64_0219/libquadmath-0.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libgfortran-3.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libgcc_s_seh-1.dll"
    "${third_party_BIN_DIR}/openblas64_0219/libopenblas.dll"
    )

set(third_party_LIBRARIES
    "${third_party_LIB_DIR}/mxnet64_110/libmxnet-cpu110.lib"
    )

add_executable(mlp_cpu ${example_SRC_DIR}/mlp_cpu.cpp)
target_link_libraries(mlp_cpu ${third_party_LIBRARIES})
copy_files_if_different(mlp_cpu third_party_DLLS)
copy_rename_file_if_different(mlp_cpu "${third_party_BIN_DIR}/mxnet64_110/libmxnet-cpu110.dll" "libmxnet.dll")

add_executable(lenet_with_mxdataiter_cpu ${example_SRC_DIR}/lenet_with_mxdataiter_cpu.cpp)
target_link_libraries(lenet_with_mxdataiter_cpu ${third_party_LIBRARIES})
copy_files_if_different(lenet_with_mxdataiter_cpu third_party_DLLS)
copy_rename_file_if_different(lenet_with_mxdataiter_cpu "${third_party_BIN_DIR}/mxnet64_110/libmxnet-cpu110.dll" "libmxnet.dll")

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