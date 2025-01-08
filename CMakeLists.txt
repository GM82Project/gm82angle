cmake_minimum_required(VERSION 3.19)
project(gm82angle CXX)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
    set(CMAKE_CXX_FLAGS "/O2 /GS- /W2 /WX")
endif()

include_directories("include/angle" "include/dx9")
link_directories("lib")

add_library(gm82angle SHARED source/gm82angle.cpp)
target_link_libraries(gm82angle d3dx9 angle_shader_translator)

SET(CMAKE_CXX_FLAGS           "${CMAKE_CXX_FLAGS} /D \"SAFESEH:NO\"")
SET(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS} /SAFESEH:NO")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /SAFESEH:NO")
SET(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /SAFESEH:NO")

option(INSTALL_GEX "Install the generated .gex" OFF)

set(GEX_URL https://raw.githubusercontent.com/GM82Project/gm82gex/main/gm82gex.py)
set(GEX_PY ${CMAKE_SOURCE_DIR}/gm82gex.py)
file(DOWNLOAD ${GEX_URL} STATUS DOWNLOAD_STATUS)
list(GET DOWNLOAD_STATUS 0 STATUS_CODE)
if(${STATUS_CODE} EQUAL 0)
	file(DOWNLOAD ${GEX_URL} ${GEX_PY})
else()
	message(WARNING "Couldn't redownload gm82gex.py")
endif()

if (INSTALL_GEX)
	add_custom_command(
		TARGET gm82angle
		POST_BUILD
		COMMAND py build_gex.py gm82angle.gej
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		COMMENT "Building .gex"
	)
else()
	add_custom_command(
		TARGET gm82angle
		POST_BUILD
		COMMAND py build_gex.py gm82angle.gej --noinstall
		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
		COMMENT "Building .gex"
	)
endif()