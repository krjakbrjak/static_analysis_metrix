FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    ninja-build \
    clang-format
