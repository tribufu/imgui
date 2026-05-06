--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "ImGui"
    location "."
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    removeplatforms { "Any CPU" }

    files
    {
        "imconfig.h",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imgui.cpp",
        "imgui.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
    }

    filter "system:macosx"
        pic "On"

    filter "system:linux"
        pic "On"

    filter "system:android"
        androidnamespace "com.tribufu.alnilam.vendor.imgui"
