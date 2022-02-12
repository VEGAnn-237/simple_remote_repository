cmake_minimum_required(VERSION 3.21)
project(sample_project2)

set(CMAKE_CXX_STANDARD 17)
enable_language(ASM_NASM)
set(CMAKE_CXX_FLAGS ${CMAKE_EXE_LINKER_FLAGS} "-fno-omit-frame-pointer")
set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS} "-no-pie")

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")

#add_executable(sample_project2 main.cpp)
add_executable(sample_project_asm asssembly.asm)
