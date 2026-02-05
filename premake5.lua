
-- the project for VKBootstrap
project "vk-bootstrap"
        kind "StaticLib"
        language "C++"
        cppdialect "C++17"
		
		debuggertype "Mixed"

        
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

        includedirs
        {
                "%{wks.location}/3rdParty/Vulkan-Headers/include",
        }

        files
        {
                path.getabsolute("%{prj.location}/src/VkBootstrap.cpp"),
                path.getabsolute("%{prj.location}/src/VKBootstrap.h"),
                path.getabsolute("%{prj.location}/src/VkBootstrapDispatch.h")
        }

        links
        {
                "vulkan"
        }

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