local PANEL = {}

AccessorFunc(PANEL, "_maxval", "MaxValue", FORCE_INT)
AccessorFunc(PANEL, "_minval", "MinValue", FORCE_INT)

function PANEL:Init()
	self.clearbtn:Remove()

	self.textentry.OnValueChange = function(self2, val) -- todo: make text input not allow numbers over the max value or min value
        if( self.OnValueChange ) then self:OnValueChange() end

        if tonumber( val ) then
        	if tonumber( val ) > self:GetMaxValue() then 
        		self2:SetValue( self:GetMaxValue() )
        	end

        	if tonumber( val ) < self:GetMinValue() then 
        		self2:SetValue( self:GetMinValue() )
        	end
        end	
    end

    self.textentry.OnChange = function(self2)
    	if( self.OnChange ) then self:OnChange() end
	end

    self.increment = vgui.Create("aui_button", self)
    self.increment:Dock(RIGHT)
    self.increment:DockMargin(0,0,0,1)
    self.increment:SetButtonCol( auiColor("SecondaryField") )
	self.increment:SetButtonIcon("aui/icons/add.png")
	self.increment:SetButtonIconRight(true)
	self.increment.DoClick = function(self2)
		if tonumber( self.textentry:GetValue() ) then
			self.textentry:SetValue( tonumber( self.textentry:GetValue() ) + 1 )
			return
		end

		self.textentry:SetValue( 0 )
	end

    self.decrement = vgui.Create("aui_button", self)
    self.decrement:Dock(RIGHT)
    self.decrement:DockMargin(0,0,0,1)
    self.decrement:SetButtonCol( auiColor("SecondaryField") )
	self.decrement:SetButtonIcon("aui/icons/subtract.png")
	self.decrement:SetButtonIconRight(true)
	self.decrement.DoClick = function(self2)
		if tonumber( self.textentry:GetValue() ) then
			self.textentry:SetValue( tonumber( self.textentry:GetValue() ) - 1 )
			return
		end

		self.textentry:SetValue( 0 )
	end

    self.textentry:SetNumeric(true)

    self:SetMaxValue(10)
    self:SetMinValue(0)

end

function PANEL:SetValue(int)
	if isnumber(int) then
		self.textentry:SetValue(int)
	end 
end

function PANEL:GetValue()
	return self.textentry:GetValue()
end

function PANEL:PerformLayout(w, h)
	self.increment:SetSize(h, h)
	self.decrement:SetSize(h, h)
end

vgui.Register("aui_numberentry", PANEL, "aui_textentry")