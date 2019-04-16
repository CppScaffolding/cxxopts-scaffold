-- scaffold geniefile for cxxopts

cxxopts_script = path.getabsolute(path.getdirectory(_SCRIPT))
cxxopts_root = path.join(cxxopts_script, "cxxopts")

cxxopts_includedirs = {
	path.join(cxxopts_script, "config"),
	cxxopts_root,
}

cxxopts_libdirs = {}
cxxopts_links = {}
cxxopts_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { cxxopts_includedirs }
	end,

	_add_defines = function()
		defines { cxxopts_defines }
	end,

	_add_libdirs = function()
		libdirs { cxxopts_libdirs }
	end,

	_add_external_links = function()
		links { cxxopts_links }
	end,

	_add_self_links = function()
		links { "cxxopts" }
	end,

	_create_projects = function()

project "cxxopts"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		cxxopts_includedirs,
	}

	defines {}

	files {
		path.join(cxxopts_script, "config", "**.h"),
		path.join(cxxopts_root, "**.h"),
		path.join(cxxopts_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
