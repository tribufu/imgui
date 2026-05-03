--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "ImGui"
    targetname "imgui"
    location "."
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

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

    if _ACTION == "vs2026" and os.target() == "windows" then
        filter { "system:windows", "architecture:x86_64" }
            targetdir("%{prj.location}/bin/win-x64")
        filter { "system:windows", "architecture:x86" }
            targetdir("%{prj.location}/bin/win-x86")
        filter { "system:windows", "architecture:AARCH64" }
            targetdir("%{prj.location}/bin/win-arm64")
        filter { "system:windows", "architecture:ARM" }
            targetdir("%{prj.location}/bin/win-arm")
    end

    if not (_ACTION == "vs2026") then
        filter { "platforms:*" }
            targetdir("%{prj.location}/bin/%{cfg.platform}")
    end
