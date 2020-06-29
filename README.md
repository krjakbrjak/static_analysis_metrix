# static_analysis_metrix

A simple example of how to set C++ static analisys in Jenkins pipeline.
[CMake](https://cmake.org/) has built-in capabilities to run [clang-tidy](https://clang.llvm.org/extra/clang-tidy/),
[cppcheck](http://cppcheck.sourceforge.net/), etc. See [CXX_CLANG_TIDY](https://cmake.org/cmake/help/v3.6/prop_tgt/LANG_CLANG_TIDY.html)
and [CXX_CPPCHECK](https://cmake.org/cmake/help/v3.10/prop_tgt/LANG_CPPCHECK.html) for more details.

## How to build

```shell
mkdir -p build
cd build
cmake -DBUILD_SAMPLE=ON ..
cmake --build .
```
