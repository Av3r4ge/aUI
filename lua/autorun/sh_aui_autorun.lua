AUI = AUI or {}

if SERVER then

	AddCSLuaFile("aui/config/theme.lua")
	include("aui/config/theme.lua")

	AddCSLuaFile("aui/cl_fonts.lua")
	AddCSLuaFile("aui/cl_colors.lua")
	AddCSLuaFile("aui/cl_debug.lua")

	local files = file.Find("aui/elements/*", "LUA")
    for _, v in pairs(files) do
        AddCSLuaFile("aui/elements/" .. v)
    end

else

	include("aui/config/theme.lua")
	include("aui/cl_fonts.lua")
	include("aui/cl_colors.lua")
	include("aui/cl_debug.lua")

	local files = file.Find("aui/elements/*", "LUA")
    for _, v in pairs(files) do
        include("aui/elements/" .. v)
    end

end