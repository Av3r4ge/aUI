local PANEL = {}

local scrw, scrh = ScrW(), ScrH()
local surface = surface


AUI.Fonts.Register("aui_default_textfont", 6, 3)

function PANEL:Init()
	self:SetSize(50,50)
	self:SetText("")

	self.btnicon = nil
	self.btnfont = "aui_default_textfont"
	self.btncol = auiColor("Primary")
	self.btntextcol = auiColor("Text")
end

function PANEL:SetButtonCol(color)
	self.btncol = color
	return self
end

function PANEL:SetButtonText( text )
	if not (self.text) then self.text = vgui.Create("DLabel", self) end 

	self.text:SetText(text)
	self.text:Dock(FILL)
	self.text:SetContentAlignment(4)

	if self.btnfont then
		self.text:SetFont(self.btnfont)
	end

	if self.btntextcol then
		self.text:SetTextColor(self.btntextcol)
	end

	self:InvalidateLayout(true)

	return self
end

function PANEL:SetFont( font )
	if not isstring(font) then return end

	if self.text then
		self.text:SetFont( font )
	end

	self.btnfont = font
end

function PANEL:SetButtonTextCol( col )
	if not IsColor(col) then return end

	if self.text then
		self.text:SetTextColor( col )
	end

	self.btntextcol = col
end

function PANEL:SetButtonIcon( mat )
	if not (self.icon) then self.icon = vgui.Create("aui_button_icon", self) end

	self.btnicon = Material( mat, "smooth") 

	self.icon:Dock(LEFT)
	self.icon:SetIcon( self.btnicon )
	self:InvalidateLayout(true)

	return self
end

function PANEL:SetButtonIconRight( bool )
	if bool then 
		self.icon:Dock(RIGHT)
		self.btndockedright = bool
	else
		self.icon:Dock(LEFT)
		self.btndockedright = bool
	end

	self:InvalidateLayout(true)
	return self
end 

function PANEL:PerformLayout(w, h)

	local totalwidth = 0

	if self.icon then
		self.icon:SetSize(h, h)
		totalwidth = totalwidth + h
	end

	if self.text then -- ugly
		surface.SetFont(self.btnfont)
		local tw, th = surface.GetTextSize( self.text:GetText() )

		totalwidth = totalwidth + tw + h/2

		self.text:SetSize(w,h)

		self:SetWide( math.max(totalwidth, w) )

		if not self.icon then
			self.text:DockMargin(h/4,0,0,0)
		end

		if self.btndockedright then
			self.text:DockMargin(h/4,0,0,0)
		end
	end

end

function PANEL:Paint(w, h)

	surface.SetDrawColor( self.btncol )
	surface.DrawRect(0,0,w,h)

	if self:IsDown() then
		surface.SetDrawColor( auiColor("Black", 90) )
		surface.DrawRect(0,0,w,h)
	elseif self:IsHovered() then
		surface.SetDrawColor( auiColor("Black", 30) )
		surface.DrawRect(0,0,w,h)
	end

end

vgui.Register("aui_button", PANEL, "DButton")