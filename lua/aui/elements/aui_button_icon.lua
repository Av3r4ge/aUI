local PANEL = {}

AccessorFunc(PANEL, "_icon", "Icon")

function PANEL:Init()
	self._icon = Material("aui/icons/unknown.png", "noclamp smooth")
	self:SetMouseInputEnabled(false)
end

function PANEL:Paint(w, h)
	surface.SetDrawColor( auiColor("White") )
	surface.SetMaterial( self._icon )
	surface.DrawTexturedRect(w * 0.2, h * 0.2, w * 0.6, h * 0.6)
end

vgui.Register("aui_button_icon", PANEL, "EditablePanel")