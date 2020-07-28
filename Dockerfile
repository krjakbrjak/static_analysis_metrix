FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    cmake \
    g++ \
    ninja-build \
    clang-tidy \
    clang-format \
    git \
    python3 \
    python3-pip

RUN python3 -m pip install conan && \
    conan profile new default --detect && \
    conan profile update settings.compiler.libcxx=libstdc++11 default

# install Catch2
RUN cd /tmp && \
    git clone --single-branch --branch v3.0.0-preview2 https://github.com/catchorg/Catch2.git && \
    cmake -S Catch2 -B Catch2_build && \
    cmake --build Catch2_build --target install && \
    rm -fr Catch2*

