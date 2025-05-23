cmake_minimum_required(VERSION 3.15)
project(CameraBendingEmulation)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
if (MSVC)
  add_compile_options(/W4)
else()
  add_compile_options(-Wall -Wextra)
endif()

include_directories(
    external/xsimd/include
    external/glm
    external/stb
    include
)

file(GLOB_RECURSE SOURCES src/*.cpp)

add_executable(CameraBendingEmulation ${SOURCES})

target_link_libraries(CameraBendingEmulation)
