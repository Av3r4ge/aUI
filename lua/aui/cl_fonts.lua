AUI.Fonts = AUI.Fonts or {}

thicknesses = {
	[1] = "ExtraLight",
	[2] = "Light",
	[3] = "Regular",
	[4] = "Medium",
	[5] = "SemiBold",
	[6] = "Bold"
}

function AUI.Fonts.Register(name, size, font_thickness)
	surface.CreateFont(name, {
		font = "IBM Plex Sans " .. thicknesses[font_thickness] or thicknesses[3],
		extended = false,
		size = ScreenScale(size),		
		antialias = true,
		symbol = false,
		additive = false,
	})
end
