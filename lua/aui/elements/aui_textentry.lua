local PANEL = {}

AUI.Fonts.Register("aui_default_textentryfont", 6, 3)

function PANEL:Init()

	self:SetSize(150, 35)

	self.textentry = vgui.Create("DTextEntry", self)
	self.textentry:Dock(FILL)
	self.textentry:SetFont("aui_default_textentryfont")
	self.textentry:DockMargin(4,0,0,0)
 
	self.textentry:SetTextColor( Color( 255, 255, 255, 255 ) )
	self.textentry:SetCursorColor( Color( 255, 255, 255 ) )

	self.textentry.Paint = function(self2, w, h)
		self2:DrawTextEntryText( self2:GetTextColor(), self2:GetHighlightColor(), self2:GetCursorColor() )

		if( not self2:IsEditing() and self2:GetText() == "" ) then
			draw.SimpleText( self2.backText or "", self2:GetFont(), 4, h/2, auiColor("TextInactive"), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end
	end

	self.textentry.OnChange = function(self2)
        if( self.OnChange ) then self:OnChange() end

        if self2:GetText() ~= "" then
			self.clearbtn:SetVisible(true)
		elseif self2:GetText() == "" then
			self.clearbtn:SetVisible(false)
		end
    end

	self.textentry.OnGetFocus = function(self2)
		if( self.OnGetFocus ) then self:OnGetFocus() end
		self2.focused = true
    end

	self.textentry.OnLoseFocus = function(self2)
		if( self.OnLoseFocus ) then self:OnLoseFocus() end
		self2.focused = false
    end

	self.textentry.OnEnter = function(self2)
		if( self.OnEnter ) then self:OnEnter() end
    end

	self.clearbtn = vgui.Create("aui_button", self)
	self.clearbtn:SetButtonCol( auiColor("SecondaryField") )
	self.clearbtn:SetButtonIcon("aui/icons/close.png")
	self.clearbtn:SetButtonIconRight(true)
	self.clearbtn:Dock(RIGHT)
	self.clearbtn:DockMargin(0,0,0,1)
	self.clearbtn:SetVisible(false)

	self.clearbtn.DoClick = function(self2)
		self.textentry:SetText("")
		self.clearbtn:SetVisible(false)
	end

	self.btn_accent = auiColor("TextInactive")

    self:InvalidateLayout()

end

function PANEL:PerformLayout(w, h)
	self.clearbtn:SetSize(h,h)
end

function PANEL:OnChange()
end

function PANEL:SetTextCol(col)
	self.textentry:SetTextColor(col)
end

function PANEL:SetTextFont(font)
	self.textentry:SetFont(font)
end

function PANEL:SetAccentCol(col)
	self.btn_accent = col
end

function PANEL:SetPlaceholderText(text)
	self.textentry.backText = text
end

function PANEL:Paint(w, h)

	surface.SetDrawColor( auiColor("SecondaryField") )
	surface.DrawRect(0,0,w,h)

	surface.SetDrawColor( self.btn_accent )
	surface.DrawRect(0, h - 1, w, 1)
end

function PANEL:PaintOver(w, h)

	if self.textentry.focused then
		surface.SetDrawColor( auiColor("Primary") )
		surface.DrawOutlinedRect(0, 0, 	w, h, 2)
	end

end

vgui.Register("aui_textentry", PANEL, "DPanel")