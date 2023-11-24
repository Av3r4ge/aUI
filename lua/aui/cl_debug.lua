concommand.Add("aui_elements", function() 

	local scrw, scrh = ScrW(), ScrH()

	local menu = vgui.Create("aui_frame")
	menu:SetSize(scrw * 0.5, scrh * 0.5)
	menu:MakePopup()
	menu:Center()


	local button = vgui.Create("aui_button", menu)
	button:Dock(TOP)
	button:SetButtonText("Primary Button")
	--button:SetButtonIcon("aui/icons/checkbox--checked--filled.png")
	--button:SetButtonIconRight(false)


	local btn2 = vgui.Create("aui_button", menu)
	btn2:Dock(TOP)
	btn2:SetSize(350,50)
	btn2:SetButtonText("Warning Button")
	btn2:SetButtonIcon("aui/icons/checkbox--indeterminate--filled.png")
	btn2:SetButtonCol( auiColor("Danger"))
	btn2:SetButtonIconRight(true)

	local cbox = vgui.Create("aui_checkbox", menu)
	cbox:DockMargin(4,4,0,0)
	cbox:Dock(TOP)
	cbox:SetPos(0,150)
	cbox:SetLabel( "Checkbox Button" )

	local cbox = vgui.Create("aui_checkbox_radio", menu)
	cbox:DockMargin(4,4,0,0)
	cbox:Dock(TOP)
	cbox:SetPos(0,150)
	cbox:SetLabel( "Radio Button" )

	local tentry = vgui.Create("aui_textentry", menu)
	tentry:DockMargin(0,4,0,0)
	tentry:Dock(TOP)

	local tentry = vgui.Create("aui_textentry", menu)
	tentry:DockMargin(0,4,0,0)
	tentry:Dock(TOP)
end)


