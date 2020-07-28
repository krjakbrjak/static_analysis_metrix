cmake_minimum_required(VERSION 3.0.0)
project(test_sample)

find_package(Catch2 REQUIRED)

add_executable(${PROJECT_NAME} test_sample.cpp)
target_link_libraries(${PROJECT_NAME} Catch2::Catch2WithMain)

add_test(${PROJECT_NAME} ${PROJECT_NAME})

