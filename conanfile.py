from conans import ConanFile, CMake, tools
import os


class ExampleConan(ConanFile):
    name = "static_analysis_metrix"
    version = "0.1"
    license = "<Put the package license here>"
    author = "<Put your name here> <And your email here>"
    url = "<Package recipe repository url here, for issues about the package>"
    description = "<Description of Example here>"
    topics = ("<Put some tag here>", "<here>", "<and here>")
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False]}
    default_options = {"shared": False}
    generators = "cmake"
    exports_sources="*"
    generators = "cmake_paths"
    build_requires = "catch2/3.0.0@catchorg/stable"
    build_policy = "missing"

    def build(self):
        cmake = CMake(self)
        cmake.configure(defs={
            f"CMAKE_PROJECT_{self.name}_INCLUDE": os.path.join(self.build_folder, "conan_paths.cmake")
            },
            build_folder='build')
        cmake.install()

    def package_info(self):
        self.cpp_info.libs = [self.name]

