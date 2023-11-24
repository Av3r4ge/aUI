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
			self.btndock:SetSize(w, scrh * 0.06)
			self:Center()
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


--[[function AUI:CreateBasicModal(title)
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

AUI:CreateBasicModal("Test")]]

AUI.Fonts.Register("aui_modal_buttonfont", 8, 3)
AUI.Fonts.Register("aui_modal_labelfont", 6, 3)

function AUI:CreateNumberInputModal(title, labeltext, min, max, confirmtext, confirmcolor, canceltext, cancelcolor, confirmfunc)
	local modal = vgui.Create("aui_modal")
	modal:SetTitle(title)
	modal:EnableBlur(true)

	-- input text
	-- get margin from title
	local margin = modal.header:GetTall() * 0.4

	local label = vgui.Create("DLabel", modal:GetContentDock() )
	label:SetTextColor( auiColor("TextInactive") )
	label:SetFont("aui_modal_labelfont")
	label:SetText(labeltext)
	label:Dock(TOP)
	label:DockMargin(margin,0,margin,margin/2)
	label:SetContentAlignment(1)
	label:SetTall( scrh * 0.025)

	local numinput = vgui.Create("aui_numberentry", modal:GetContentDock() )
	numinput:SetMaxValue(min)
	numinput:SetMaxValue(max)
	numinput:Dock(FILL)
	numinput:DockMargin(margin,0,margin,margin)

	-- bottom buttons

	local cancel = vgui.Create("aui_button", modal:GetButtonDock() )
	cancel:SetButtonCol( cancelcolor )
	cancel:SetFont("aui_modal_buttonfont")
	cancel:Dock(LEFT)
	cancel:SetButtonText( canceltext )
	cancel:SetWide(modal:GetWide() / 2)

	cancel.DoClick = function(self2)
		modal:Remove()
	end

	local confirm = vgui.Create("aui_button", modal:GetButtonDock() )
	confirm:SetButtonText( confirmtext )
	confirm:SetFont("aui_modal_buttonfont")
	confirm:SetButtonCol( confirmcolor )
	confirm:Dock(RIGHT)
	confirm:SetWide( modal:GetWide() / 2 )

	modal:SetTall( scrh * 0.2 )

	confirm.DoClick = function(self2)
		confirmfunc(numinput:GetValue())

		if modal then modal:Remove() end
	end

	modal:SetWide( modal:GetWide() + 1 ) -- create gap between buttons

	return modal
end

--AUI:CreateNumberInputModal("Number Input", "Input number (1-100)", 1, 100, "Confirm", auiColor("Primary"), "Cancel", auiColor("TertiaryBG"), function() end)