# Copyright (c) Tribufu. All Rights Reserved.
# SPDX-License-Identifier: UNLICENSED

cmake_minimum_required(VERSION 3.20)

project(imgui CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")

add_library(imgui STATIC)

target_sources(imgui PRIVATE
    imconfig.h
    imgui_demo.cpp
    imgui_draw.cpp
    imgui_internal.h
    imgui_tables.cpp
    imgui_widgets.cpp
    imgui.cpp
    imgui.h
    imstb_rectpack.h
    imstb_textedit.h
    imstb_truetype.h
)

target_include_directories(imgui PUBLIC .)
target_compile_features(imgui PUBLIC cxx_std_17)

if(APPLE OR UNIX)
    set_target_properties(imgui PROPERTIES POSITION_INDEPENDENT_CODE ON)
endif()
