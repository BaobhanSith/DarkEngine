workspace "DarkEngine"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "DarkEngine/vendor/GLFW/include"

include "DarkEngine/vendor/GLFW"

project "DarkEngine"
    location "DarkEngine"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "dkpch.h"
    pchsource "DarkEngine/src/dkpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "DK_PLATFORM_WINDOWS",
            "DK_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "DK_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DK_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DK_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "DarkEngine/vendor/spdlog/include",
        "DarkEngine/src"
    }

    links
    {
        "DarkEngine"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "DK_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "DK_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DK_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "DK_DIST"
        optimize "On"