project "VKBootstrap"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {
		"%{IncludeDir.VulkanSDK}"
	}

	files {
		"src/VKBootstrap.h",
		"src/VKBootstrap.cpp",
		"src/VkBootstrapDispatch.h"
	}
	
	filter "system:windows"
		staticruntime "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"