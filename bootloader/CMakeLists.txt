cmake_minimum_required(VERSION 3.17)
project(bootloader LANGUAGES ASM_NASM)

add_compile_options(
        "$<$<COMPILE_LANGUAGE:ASM_NASM>:-f $<IF:$<BOOL:$<TARGET_PROPERTY:NASM_OBJ_FORMAT>>, \
    $<TARGET_PROPERTY:NASM_OBJ_FORMAT>, ${CMAKE_ASM_NASM_OBJECT_FORMAT}>>"
)

set(CMAKE_ASM_NASM_FLAGS_DEBUG "-g -Fdwarf")
set(SRC_FILES bootloader.asm io.asm)

add_executable(${PROJECT_NAME} ${SRC_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES NASM_OBJ_FORMAT bin)
