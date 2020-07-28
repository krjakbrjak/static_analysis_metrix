FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    cmake \
    g++ \
    ninja-build \
    clang-tidy \
    clang-format \
    git

# install Catch2
RUN cd /tmp && \
    git clone --single-branch --branch v3.0.0-preview2 https://github.com/catchorg/Catch2.git && \
    cmake -S Catch2 -B Catch2_build && \
    cmake --build Catch2_build --target install && \
    rm -fr Catch2*

