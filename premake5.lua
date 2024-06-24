project "VKBootstrap"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {
		"%{IncludeDir.VulkanSDK}"
	}

	files {
		"src/VkBootstrap.h",
		"src/VkBootstrap.cpp",
		"src/VkBootstrapDispatch.h"
	}
	
	filter { "options:buildType=shared", "system:linux" }
		buildoptions { "-fPIC" }
	
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