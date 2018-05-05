## Demo for mxnet 1.1.0 cpu/gpu on windows

This repo shows how to use mxnet cpp api on windows.

### Requirements

- Cmake > 3.10
- Visual Studio > 2015

### Build

```bash
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" ../cmake
```

Then, open with vs2017, and **set configuration to `Release`** or it will link failed(because the opencv is Release version).

### Pre-build binaries or other files

All can be download at [mxnet64_110 depends](https://pan.baidu.com/s/1sD8f3TDLxSBfLrqC6xwjjg)