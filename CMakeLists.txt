cmake_minimum_required(VERSION 3.0.0)
project(static_analysis_metrix)

enable_testing()

add_library(interfaces INTERFACE)
target_include_directories(interfaces
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include)

install(
    TARGETS
        interfaces
    EXPORT
        interfaces-config
    LIBRARY DESTINATION
        lib
)

install(
    EXPORT
        interfaces-config
    DESTINATION
        lib/cmake/interfaces
)

if (BUILD_SAMPLE)
    add_subdirectory(sample)
endif ()

add_subdirectory(tests)

