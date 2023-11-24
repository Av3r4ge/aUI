local PANEL = {}

local scrw, scrh = ScrW(), ScrH()

function PANEL:Init()

	self:SetSize(scrw * 0.25, scrh * 0.4)
	self:Center()
	self:MakePopup()
	self:DoModal()

	self.content = vgui.Create("Panel", self)
	self.content:Dock(FILL)

	self.content.PerformLayout = function(self2, w, h)
		if self.btndock then
			self.btndock:SetSize(w, h * .2)
		end
	end

	self.btndock = vgui.Create("Panel", self.content)
	self.btndock:Dock(BOTTOM)

	self.content:InvalidateLayout(true)
end
	
function PANEL:GetButtonDock()
	return self.btndock
end

function PANEL:GetContentDock()
	return self.content
end

vgui.Register("aui_modal", PANEL, "aui_frame")

AUI.Fonts.Register("aui_modal_buttonfont", 8, 3)

function AUI:CreateBasicModal(title)
	local modal = vgui.Create("aui_modal")
	modal:SetTitle(title)
	modal:EnableBlur(true)

	local cancel = vgui.Create("aui_button", modal:GetButtonDock() )
	cancel:SetButtonCol( auiColor("TertiaryBG") )
	cancel:SetFont("aui_modal_buttonfont")
	cancel:Dock(LEFT)
	cancel:SetButtonText("Cancel")
	cancel:SetWide(modal:GetWide() / 2)

	local confirm = vgui.Create("aui_button", modal:GetButtonDock() )
	confirm:SetButtonText("Confirm")
	confirm:SetFont("aui_modal_buttonfont")
	confirm:SetButtonCol( auiColor("Primary") )
	confirm:Dock(RIGHT)
	confirm:SetWide( modal:GetWide() / 2 )

	modal:SetWide( modal:GetWide() + 1 ) -- create gap between buttons

	return modal
end

AUI:CreateBasicModal("Test")