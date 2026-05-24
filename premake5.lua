--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "ImGui"
    targetname "imgui"
    location "."
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    removeplatforms { "Any CPU" }

    files
    {
        "*.cpp",
        "*.h",
    }

    includedirs
    {
        "../glfw/include",
        ".",
    }

    filter { "system:windows" }
        files
        {
            "./backends/imgui_impl_win32.*",
            "./backends/imgui_impl_dx9.*",
            "./backends/imgui_impl_dx10.*",
            "./backends/imgui_impl_dx11.*",
            "./backends/imgui_impl_dx12.*",
        }

    filter "system:macosx"
        pic "On"

        files
        {
            "./backends/imgui_impl_metal.*",
            "./backends/imgui_impl_osx.*",
        }

    filter "system:linux"
        pic "On"

    filter "system:android"
        androidnamespace "com.tribufu.vendor.imgui"

        files
        {
            "./backends/imgui_impl_android.*",
        }

    filter "not system:android"
        files
        {
            "./backends/imgui_impl_glfw.*",
            "./backends/imgui_impl_opengl3.*",
        }

        defines
        {
            "GLFW_INCLUDE_NONE",
        }
