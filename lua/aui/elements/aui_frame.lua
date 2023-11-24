local PANEL = {}

AUI.Fonts.Register("aui_default_titlefont", 8, 4)

function PANEL:Init()

	self.header = vgui.Create("Panel", self)
	self.header:Dock(TOP)
	self.header:SetTall( ScreenScale(16) )
	self.header.Paint = function(self2, w, h)
		surface.SetDrawColor( auiColor("MainBG") )
		surface.DrawRect(0,0,w,h)
	end

	self.close = vgui.Create("aui_button", self.header)
	self.close:SetButtonCol( auiColor("MainBG") )
	self.close:SetButtonIcon("aui/icons/close.png")
	self.close:SetButtonIconRight(true)
	self.close:Dock(RIGHT)
 		
 	self.close.DoClick = function()
 		self:Remove()
 	end

 	self.backcol = auiColor("MainBG")

end

function PANEL:SetBackgroundColor(col)
	self.backcol = col
end

function PANEL:SetTitle(text)

	self.headertitle = vgui.Create("DLabel", self.header)
	self.headertitle:SetText(text)
	self.headertitle:SetFont("aui_default_titlefont")
	self.headertitle:SetTextColor( auiColor("Text") )

	self.headertitle:Dock(FILL)

	self:InvalidateLayout(true)

end

function PANEL:EnableBlur(bool)
	self.enablebackblur = bool
	self.starttime = SysTime()
end

function PANEL:PerformLayout(w,h)

	if self.headertitle then
		self.headertitle:DockMargin( self.close:GetTall() * 0.4,0,0,0 )
	end

end

function PANEL:Paint(w,h)
	if self.enablebackblur then 
		Derma_DrawBackgroundBlur(self, self.starttime)
	end

	surface.SetDrawColor( self.backcol )
	surface.DrawRect(0,0,w,h)
end

vgui.Register("aui_frame", PANEL, "EditablePanel")