AUI.ColorCache = {}

function hex2rgb(hex)
    local hex = hex:gsub("#","")
    if hex:len() == 3 then
      return Color( (tonumber("0x"..hex:sub(1,1))*17), (tonumber("0x"..hex:sub(2,2))*17), (tonumber("0x"..hex:sub(3,3))*17) )
    else
      return Color( tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)) )
    end
end

auiColor = function(color, alpha)
	if AUI.ColorCache[color] then 
		local col = AUI.ColorCache[color]

		return Color(col.r, col.g, col.b, alpha or 255)
	end
end

-- load config colors

for k, v in pairs( AUI.Colors ) do
	AUI.ColorCache[k] = hex2rgb(v)
end 