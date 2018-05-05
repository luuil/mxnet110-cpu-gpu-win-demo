# Compiling MXNet 1.1.0 and the CPP PACKAGE on Windows 10

I'll show you how to compiling MXNet 1.1.0 and the `CPP PACKAGE` on Windows 10.

## Requirements

- Windows 10 64bit
- [Visual Studio win64 >= 2015][vs]
- [CMake >= 3.10][cmake]
- [MXNet >= 1.1.0][mxnet]
- [OpenBLAS win64 >= 0.2.19][openblas]
- [OpenCV >= 3.4.1][opencv] (optional)
- [CUDA >= 8.0][cuda] (optional)
- [cuDNN >= 6.1][cudnn] (optional)

> The versions mentioned above is the version that I used to complete the compile.

## Building

Use cmake-gui to create a VS Solution:

![cmake](http://wx3.sinaimg.cn/mw690/c11835d4gy1fqrg592tjwj20vs0p50tv.jpg)

If you want to build the CPP PACKAGE, turn the `USE_CPP_PACKAGE` option ON,
and put all the dll files as shown below to directory `cpp-package/scripts`,
so that `libmxnet.dll` can be imported correctly when build CPP PACKAGE.

```
# openblas
libopenblas.dll
libgcc_s_seh-1.dll
libgfortran-3.dll

# cuda
cublas64_80.dll
cufft64_80.dll
cusolver64_80.dll
curand64_80.dll
nvrtc64_80.dll
nvcuda.dll
```

- the file starts with `cu` or `nv` can be found in CUDA installation directory
- `libopenblas.dll` can be found in [openblas][openblas] installation directory
- `libgcc_s_seh-1.dll` and `libgfortran-3.dll` which is depends by `libopenblas.dll` can be downloaded at [openblas0.2.12][openblas0212],  `mingw64_dll.zip` should be download if you compiler is set to win64, or download `mingw32_dll.zip` directly.

Then, the mxnet and the CPP PACKAGE will be built successfully.

[openblas]: https://sourceforge.net/projects/openblas/files
[openblas0212]: https://sourceforge.net/projects/openblas/files/v0.2.15/
[opencv]: https://sourceforge.net/projects/opencvlibrary/files/opencv-win
[vs]: https://www.visualstudio.com
[cmake]: https://cmake.org/download/
[mxnet]: https://github.com/apache/incubator-mxnet/releases
[cuda]: https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=10&target_type=exelocal
[cudnn]: https://developer.nvidia.com/cudnn