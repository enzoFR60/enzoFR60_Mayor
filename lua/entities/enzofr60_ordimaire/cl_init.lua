include("shared.lua")

include("autorun/sh_config_enzofr60_mayor.lua")

surface.CreateFont( "OrdiM", {
 font = "HUDNumber5",
 size = 30,
 weight = 99900,
})

function ENT:Draw()
	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	local TextAng = Ang
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < self:GetNWInt("distance") then
		cam.Start3D2D(Pos+Ang:Right()*22+Ang:Up()*-1+Ang:Forward()*-10, Ang, 0.1)
		draw.RoundedBox( 30, -35, -335, 275, 70, Color(0,0,0,200) )
		
		if enzoFR60.SelectedLanguage == "fr" then
			draw.SimpleTextOutlined( enzoFR60.LanguageComputerMayor, "OrdiM", 10, -335, Color(0,211,211,200), 0, 0, 1, Color(0,0,0,200) )
			draw.SimpleTextOutlined( enzoFR60.LanguageMayor, "OrdiM", 60, -300, Color(0,211,211,200), 0, 0, 1, Color(0,0,0,200) )
		elseif enzoFR60.SelectedLanguage == "en" then
			draw.SimpleTextOutlined( enzoFR60.LanguageComputerMayor, "OrdiM", -5, -319, Color(0,211,211,200), 0, 0, 1, Color(0,0,0,200) )
		end
		cam.End3D2D()
	end
end