cmake_minimum_required(VERSION 3.0.0)
project(static_analysis_metrix)


add_library(interfaces INTERFACE)
target_include_directories(interfaces
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

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
