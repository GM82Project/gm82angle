cmake_minimum_required(VERSION 3.19)
project(gm82dx9 CXX)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
    set(CMAKE_CXX_FLAGS "/O2 /GS- /W2 /WX")
endif()

include_directories("include/angle" "include/dx9")
link_directories("lib")

add_library(gm82shdcmp SHARED source/gm82shdcmp.cpp)
target_link_libraries(gm82shdcmp d3dx9 angle_shader_translator)

SET(CMAKE_CXX_FLAGS           "${CMAKE_CXX_FLAGS} /D \"SAFESEH:NO\"")
SET(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS} /SAFESEH:NO")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /SAFESEH:NO")
SET(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /SAFESEH:NO")

option(INSTALL_GEX "Install the generated .gex" OFF)

if (INSTALL_GEX)
	add_custom_command(
		TARGET gm82shdcmp
		POST_BUILD
		COMMAND py build_gex.py gm82shdcmp.gej
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		COMMENT "Building .gex"
	)
else()
	add_custom_command(
		TARGET gm82shdcmp
		POST_BUILD
		COMMAND py build_gex.py gm82shdcmp.gej --noinstall
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		COMMENT "Building .gex"
	)
endif()