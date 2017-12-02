cmake_minimum_required(VERSION 3.8)
project(Compiler)

set(CMAKE_CXX_STANDARD 17)

set(SOURCE_FILES 词法分析.c  符号表.c  语法分析.c  语义分析.c  中间代码生成.c)
add_executable(Compiler ${SOURCE_FILES})
