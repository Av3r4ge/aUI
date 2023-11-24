local PANEL = {}

function PANEL:Init()
	self.btn_untoggledmat = Material("aui/icons/radio-button.png", "noclamp smooth")
	self.btn_toggledmat = Material("aui/icons/radio-button--checked.png", "noclamp smooth")
end

vgui.Register("aui_checkbox_radio", PANEL, "aui_checkbox")