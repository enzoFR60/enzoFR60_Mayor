include("shared.lua")

include("autorun/sh_config_enzofr60_mayor.lua")

surface.CreateFont( "PanMP", {
 font = "HUDNumber5",
 size = 70,
 weight = 99900,
})

surface.CreateFont( "PanMPLaw", {
 font = "DermaLarge",
 size = 60,
 weight = 800,
})

function ENT:Draw()
	self:DrawModel()
	
	local function GetMayor()

        for k, v in pairs(player.GetAll()) do

            if v:Team() == enzoFR60.TeamMenu then return v:Nick() end

        end

        return enzoFR60.LanguageDontMayor

    end
	
	local function GetRMayor()

			for k, v in pairs(player.GetAll()) do

				if v:Team() == enzoFR60.TeamMenu then return " "..enzoFR60.LanguageRegime.. " : "..GetGlobalString( 69584588785, enzoFR60.LanguageRegimeComing ) end

			end

			return enzoFR60.LanguageRegime.." : "..enzoFR60.LanguageRegimeComing

		end
		
	lawspls = DarkRP.getLaws() 

	local str = ""

	for k, v in pairs( lawspls ) do -- Turns laws from a table into strings
		str = str.. k .. "." .. " " .. v .. "\n"
	end
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	local TextAng = Ang
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < self:GetNWInt("distance") then
		cam.Start3D2D(Pos+Ang:Right()*-20+Ang:Up()*1.5+Ang:Forward()*-27, Ang, 0.1)
		draw.RoundedBox( 10, -850, -390, 2250, 1200, Color(0,0,0,255) )
		draw.RoundedBox( 10, -850, -390, 2250, 330, Color(30,30,30,250) )
		draw.SimpleTextOutlined( "Population : "..player.GetCount(), "PanMP", 70, -240, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,150) )
		
		draw.DrawText( "Lois : \n"..str, "PanMPLaw", -800, -40, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,150) )
		draw.SimpleTextOutlined( enzoFR60.LanguageMayor.." : "..GetMayor(), "PanMP", 30, -335, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,150) )
		draw.SimpleTextOutlined( GetRMayor(), "PanMP", -70, -150, Color(255,255,255,255), 0, 0, 1, Color(0,0,0,150) )
		cam.End3D2D()
	end
--
end

-- 3D2D TDUI --

local tdui = include("autorun/tdui.lua")

local p
hook.Add("PostDrawTranslucentRenderables", "Paint3D2DUI", function(bDrawingSkybox, bDrawingDepth)
	for k, v in pairs( ents.FindByClass( "enzofr60_panneaumaire" ) ) do
	
	Ang = v:GetAngles()
	Pos = v:GetPos()
	
	Ang:RotateAroundAxis(Ang:Up(), 180)
	Ang:RotateAroundAxis(Ang:Forward(), 0)
	
	if LocalPlayer():GetPos():Distance(Pos) < 1200 and LocalPlayer():Team() == enzoFR60.TeamMenu then
		
    if bDrawingDepth then return end
	
    p = p or tdui.Create()

    if p:Button(enzoFR60.LanguageAddLaw, "DermaLarge", -200, 160, 400, 100) then
        net.Start( "Mairem:MenuLaw:OpenMenuLaw1" )
		net.WriteString("ouiyes")
		net.SendToServer()
	end
	
	if p:Button(enzoFR60.LanguageRemoveLaw, "DermaLarge", -200, 300, 400, 100) then
        net.Start( "Mairem:MenuLaw:OpenMenuLaw2" )
		net.WriteString("nonno")
		net.SendToServer()
    end
	
	if enzoFR60.PanOpenMenu == true and GetGlobalString( "enzoFR60.PanOpenMenuYesNo", "Oui" ) == "Oui" then
	if p:Button(enzoFR60.LanguageChangeregime, "DermaLarge", 1500, 240, 400, 100) then
        net.Start( "Mairemenu:Open:ChangeRegime" )
		net.SendToServer()
    end
	end
	
	if enzoFR60.MAMayor[LocalPlayer():GetUserGroup()] then
	
	p:Mat(Material("icon16/computer_edit.png"), 1860, 150, 42, 42)
	
	if p:Button("", "DermaLarge", 1860, 150, 43, 42) then
        net.Start( "Mairemenu:ChangeSettings" )
		net.SendToServer()
    end
	
	end
	
    p:Cursor()

    p:Render(Pos+Ang:Right()*-85+Ang:Up()*70.5+Ang:Forward()*-0.8, Ang, 0.1)
	
	end
	
	end
end)
