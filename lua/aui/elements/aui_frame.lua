local PANEL = {}

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

end

function PANEL:Paint(w,h)
	surface.SetDrawColor( auiColor("SecondaryBG") )
	surface.DrawRect(0,0,w,h)
end

vgui.Register("aui_frame", PANEL, "EditablePanel")