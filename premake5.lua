workspace "Clever"
	architecture "x64"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Clever/vender/GLFW/include"
IncludeDir["glm"] = "Clever/vender/glm/include"
IncludeDir["rapidjson"] = "Clever/vender/rapidjson/include"
IncludeDir["stb_image"] = "Clever/vender/stb_image/include"
IncludeDir["tinyobjloader"] = "Clever/vender/tinyobjloader/include"
IncludeDir["vulkan"] = "Clever/vender/vulkan/Include"

include "Clever/vender/GLFW"

project "Clever"
	location "Clever"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/Clever/src/**.h",
		"%{prj.name}/Clever/src/**.cpp",
		"%{prj.name}/vender/stb_image/**.h",
		"%{prj.name}/vender/glm/glm/**.hpp",
		"%{prj.name}/vender/glm/glm/**.inl",
		"%{prj.name}/vender/rapidjson/**.h",
		"%{prj.name}/vender/stb_image/**.h",
		"%{prj.name}/vender/tinyobjloader/**.h",
		"%{prj.name}/vender/vulkan/vulkan.h"
	}
	
	includedirs
	{
		"%{prj.name}/Clever/src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.vulkan}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.rapidjson}",
		"%{IncludeDir.stb_image}",
		"%{IncludeDir.tinyobjloader}",
	}

	links
	{
		"GLFW",
		"Clever/vender/vulkan/Lib/vulkan-1.lib"
	}
	
	ABSOLUTE_PATH = path.getabsolute(os.getcwd())
	
	defines
	{
	'RESOURCES="'..ABSOLUTE_PATH..'/Clever/Clever/Resources/"'
	}
	
	filter "system:windows"
		
		staticruntime "On"
		systemversion "latest"