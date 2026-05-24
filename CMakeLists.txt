cmake_minimum_required(VERSION 3.16)

project(imgui CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<LOWER_CASE:$<CONFIG>>/${MTK_PRESET_NAME}")

add_library(imgui STATIC)

target_sources(imgui PRIVATE
    backends/imgui_impl_opengl3.cpp
    backends/imgui_impl_opengl3.h
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

if((WIN32 AND NOT XBOX) OR(APPLE AND NOT IOS) OR(UNIX AND NOT ANDROID AND NOT IOS AND NOT EMSCRIPTEN))
    target_sources(imgui PRIVATE
        backends/imgui_impl_glfw.cpp
        backends/imgui_impl_glfw.h
    )

    target_include_directories(imgui PUBLIC
        ../glfw/include
    )

    target_compile_definitions(imgui PRIVATE
        GLFW_INCLUDE_NONE
    )
endif()

if(ANDROID OR EMSCRIPTEN)
    target_sources(imgui PRIVATE
        backends/imgui_impl_sdl3.cpp
        backends/imgui_impl_sdl3.h
    )

    target_compile_definitions(imgui PRIVATE
        SDL_MAIN_HANDLED
    )
endif()

if(IOS)
endif()
