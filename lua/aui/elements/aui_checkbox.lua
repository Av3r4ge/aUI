local PANEL = {}

AccessorFunc(PANEL, "btn_checked", "Checked", FORCE_BOOL)

AUI.Fonts.Register("aui_default_cbfont", 6, 3)

function PANEL:Init()

	self:SetSize(25,25)
	self:SetText("")

	self.btn_untoggledmat = Material("aui/icons/checkbox.png")
	self.btn_toggledmat = Material("aui/icons/checkbox--checked--filled.png")

	self.btnfont = "aui_default_cbfont"

	self.btntextcol = auiColor("Text")
	self.btn_col = auiColor("Text")

end

function PANEL:SetLabel( text )
	if not (self.text) then self.text = vgui.Create("DLabel", self) end 

	self.text:SetFont(self.btnfont)
	self.text:SetContentAlignment(4)
	self.text:SetText( text )
	self.text:SetTextColor( self.btntextcol )

	self:InvalidateLayout(true)
end

function PANEL:PerformLayout(w, h)

	local totalwidth = h

	if self.text then -- ugly
		surface.SetFont(self.btnfont)
		local tw, th = surface.GetTextSize( self.text:GetText() )

		totalwidth = totalwidth + tw + h/2

		self.text:SetSize(tw,h)
		self.text:SetPos( (h/4) + h )

		self:SetWide( math.max(totalwidth, h) )
	end

end

function PANEL:SetButtonCol( col )

end

function PANEL:SetToggledMat( mat )

end

function PANEL:SetUntoggledPath( mat )

end

function PANEL:DoClick()

	self:Toggle()

end

function PANEL:Toggle()

	self:SetValue( not self:GetChecked() )

end

function PANEL:SetValue( val )

	if ( tonumber( val ) == 0 ) then val = 0 end
	val = tobool( val )

	self:SetChecked( val )
	self.btn_checked = val

	self:OnChange( val )

	if ( val ) then val = "1" else val = "0" end

end

function PANEL:Paint(w, h)

	surface.SetDrawColor( self.btn_col )

	if self:GetChecked() then 
		surface.SetMaterial( self.btn_toggledmat ) 
	else
		surface.SetMaterial( self.btn_untoggledmat ) 
	end

	surface.DrawTexturedRect(0, 0, h, h)

end


function PANEL:OnChange( val )

end

vgui.Register("aui_checkbox", PANEL, "DButton")