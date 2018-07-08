--[[-------------------------------------------------------------------------
	Menu Maire
---------------------------------------------------------------------------]]

include("autorun/sh_config_enzofr60_mayor.lua")

--[[-------------------------------------------------------------------------
	Blur
---------------------------------------------------------------------------]]

local blur = Material("pp/blurscreen")
function DrawBlurMayorEnzoFR60( p, a, d )
	local x, y = p:LocalToScreen( 0, 0 )
	
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( blur )
	
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		
		render.UpdateScreenEffectTexture()
		
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

net.Receive( "Mairem:OpenMenu", function()
	Timestampv = os.time()
	TimeStringp = os.date( "%H "..enzoFR60.LanguageHours.. " %M "..enzoFR60.LanguageMinutes , Timestampv )
	
	local Base = vgui.Create( "DFrame" )
	Base:SetSize( 500, 220 )
	Base:Center()
	Base:SetTitle( TimeStringp..", "..enzoFR60.LanguageHello.." "..LocalPlayer():GetName() )
	Base:SetDraggable( true )
	Base:MakePopup()
	Base.Paint = function( self, w, h )
		DrawBlurMayorEnzoFR60( self, 6, 30 )
		draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		draw.RoundedBox( 1, 0, 0, w, 25, Color( 0, 0, 0, 80 ) )   
		draw.RoundedBox( 1, 0, 25, w, 1, Color( 0, 0, 0, 80 ) ) 
	end
	
	local BaseTemps = vgui.Create( "DForm", Base )
		BaseTemps:SetPos( 25, 50 )
		BaseTemps:SetSize( 450, 0 )
		BaseTemps:SetSpacing( 10 )
		BaseTemps:SetName( enzoFR60.LanguageConfig )
	BaseTemps.Paint = function()
		surface.SetDrawColor( 255, 51, 15, 255 )
		surface.DrawOutlinedRect( 0, 0, BaseTemps:GetWide(), BaseTemps:GetTall() ) 
	end
	
	local maire = vgui.Create( "DComboBox", BaseTemps )
		maire:SetSize( BaseTemps:GetWide() - 15, 25 )
		maire:SetPos( 5, 65 )
		maire:SetValue( enzoFR60.LanguageListMaire )
		maire:SetTextColor(  Color( 255, 255, 255, 200 ) )
		maire:AddChoice( enzoFR60.LanguageDictatorship )
		maire:AddChoice( enzoFR60.LanguageDemocracy )		
		maire.Paint = function( self, w, h )
			draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		end
 
    local temps = vgui.Create( "DNumSlider" )
    temps:SetText( enzoFR60.LanguageTempConfig )
    temps:SetMin( 0 )
    temps:SetMax( 60 )
    temps:SetDecimals( 0 )
	BaseTemps:AddItem( temps )
 

	local changerleregime = vgui.Create( "DButton", Base )
	changerleregime:SetSize( 240, 25 )
	changerleregime:SetPos( 125, Base:GetTall() - 60 )
	changerleregime:SetText( enzoFR60.LanguageChangeregime )
	changerleregime:SetFont( 'Trebuchet24' )
	changerleregime:SetTextColor(  Color( 255, 255, 255, 200 ) )
	changerleregime.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	changerleregime.OnCursorExited = function( self ) self.hover = false end
	changerleregime.Slide = 0
	changerleregime.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
		
		surface.SetDrawColor( 255, 51, 15, 200 )
		surface.DrawOutlinedRect( 0, 0, changerleregime:GetWide(), changerleregime:GetTall() ) 
	end	
	changerleregime.DoClick = function()
		if maire:GetValue() == "" || maire:GetValue() == enzoFR60.LanguageListMaire then return end
		if temps:GetValue() == "" || temps:GetValue() == 0 then return end
		
			net.Start( "Mairemenu:ChangeRegime" )
			net.WriteString( maire:GetValue(), 50 )
			net.WriteFloat( temps:GetValue(), 20 )
			net.SendToServer()
			
		Base:Remove()
	end
end)

net.Receive( "Mairem:Settings:OpenMenu", function()
	
	local Base = vgui.Create( "DFrame" )
	Base:SetSize( 500, 130 )
	Base:Center()
	Base:SetTitle( enzoFR60.LanguageHello.." "..LocalPlayer():GetName() )
	Base:SetDraggable( true )
	Base:MakePopup()
	Base.Paint = function( self, w, h )
		DrawBlurMayorEnzoFR60( self, 6, 30 )
		draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		draw.RoundedBox( 1, 0, 0, w, 25, Color( 0, 0, 0, 80 ) )   
		draw.RoundedBox( 1, 0, 25, w, 1, Color( 0, 0, 0, 80 ) ) 
	end
	
	local settingsyesno = vgui.Create( "DComboBox", Base )
		settingsyesno:SetSize( Base:GetWide() - 15, 25 )
		settingsyesno:SetPos( 5, 40 )
		settingsyesno:SetTextColor(  Color( 255, 255, 255, 200 ) )
		settingsyesno:SetValue( enzoFR60.LanguageActiver )
		settingsyesno:AddChoice( enzoFR60.LanguageYes )
		settingsyesno:AddChoice( enzoFR60.LanguageNo )		
		settingsyesno.Paint = function( self, w, h )
			draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		end
 

	local changersettings = vgui.Create( "DButton", Base )
	changersettings:SetSize( 240, 25 )
	changersettings:SetPos( 125, Base:GetTall() - 50 )
	changersettings:SetText( enzoFR60.LanguageChangeSettings )
	changersettings:SetFont( 'Trebuchet24' )
	changersettings:SetTextColor(  Color( 255, 255, 255, 200 ) )
	changersettings.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	changersettings.OnCursorExited = function( self ) self.hover = false end
	changersettings.Slide = 0
	changersettings.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
		
		surface.SetDrawColor( 255, 51, 15, 200 )
		surface.DrawOutlinedRect( 0, 0, changersettings:GetWide(), changersettings:GetTall() ) 
	end	
	changersettings.DoClick = function()
		if settingsyesno:GetValue() == "" || settingsyesno:GetValue() == enzoFR60.LanguageActiver then return end
		
			net.Start( "Mairemenu:Open:Settings" )
			net.WriteString( settingsyesno:GetValue(), 50 )
			net.SendToServer()
			
		Base:Remove()
	end
end)

net.Receive( "Mairem:MenuLaw:OpenMenu", function()
	
	Timestampv = os.time()
	TimeStringp = os.date( "%H "..enzoFR60.LanguageHours.. " %M "..enzoFR60.LanguageMinutes , Timestampv )
	
	local type_law = net.ReadString()
	
	local Base = vgui.Create( "DFrame" )
	Base:SetSize( 500, 220 )
	Base:Center()
	Base:SetTitle( TimeStringp..", "..enzoFR60.LanguageHello.." "..LocalPlayer():GetName() )
	Base:SetDraggable( true )
	Base:MakePopup()
	Base.Paint = function( self, w, h )
		DrawBlurMayorEnzoFR60( self, 6, 30 )
		draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		draw.RoundedBox( 1, 0, 0, w, 25, Color( 0, 0, 0, 80 ) )   
		draw.RoundedBox( 1, 0, 25, w, 1, Color( 0, 0, 0, 80 ) ) 
	end
 
	local addLawdeleteLaw = vgui.Create("DTextEntry", Base)
	if type_law == "ouiyes" then
	addLawdeleteLaw:SetText(enzoFR60.LanguageAddLawDesc)
	elseif type_law == "nonno" then
	addLawdeleteLaw:SetText(enzoFR60.LanguageRemoveLawDesc)
	addLawdeleteLaw:SetNumeric(true)
	end
	addLawdeleteLaw:SetSize(Base:GetWide() - 80, 40)
	addLawdeleteLaw:SetPos(40, 70)
	addLawdeleteLaw:SetTextColor( Color( 255, 255, 255 ) )
	addLawdeleteLaw.Paint = function( self, w, h )
		surface.SetDrawColor( 255, 51, 15, 200 )
		surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() ) 
	
		surface.SetDrawColor(0, 0, 0, 120)
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		self:DrawTextEntryText(Color(255, 255, 255), Color(30, 130, 255), Color(255, 255, 255))
	end

	local AddRemoveLaw = vgui.Create( "DButton", Base )
	AddRemoveLaw:SetSize( 240, 25 )
	AddRemoveLaw:SetPos( 125, Base:GetTall() - 60 )
	if type_law == "ouiyes" then
		AddRemoveLaw:SetText( enzoFR60.LanguageAddLaw )
	elseif type_law == "nonno" then
		AddRemoveLaw:SetText( enzoFR60.LanguageRemoveLaw )
	end
	AddRemoveLaw:SetFont( 'Trebuchet24' )
	AddRemoveLaw:SetTextColor(  Color( 255, 255, 255, 200 ) )
	AddRemoveLaw.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	AddRemoveLaw.OnCursorExited = function( self ) self.hover = false end
	AddRemoveLaw.Slide = 0
	AddRemoveLaw.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
		
		surface.SetDrawColor( 255, 51, 15, 200 )
		surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() ) 
	end	
	AddRemoveLaw.DoClick = function()
		if addLawdeleteLaw:GetText() == "" || addLawdeleteLaw:GetText() == "" then return end
		
		if type_law == "ouiyes" then
			RunConsoleCommand( "say", "/addlaw "..addLawdeleteLaw:GetText() )
		elseif type_law == "nonno" then 
			RunConsoleCommand( "say", "/removelaw "..addLawdeleteLaw:GetText() )
		end
			
		Base:Remove()
	end
	
end)