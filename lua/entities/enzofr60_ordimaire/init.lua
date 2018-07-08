AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

include("autorun/sh_config_enzofr60_mayor.lua")

function ENT:Initialize()
	self:SetModel("models/Highrise/cubicle_monitor_01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:SetNWInt("distance", 120);
	self:SetNWFloat("distance", 520);
	self:SetUseType( SIMPLE_USE )

end


function ENT:AcceptInput( Name, Activator, called )

	if Name == "Use" && IsValid( called ) && called:IsPlayer() then
		
		if called:Team() == enzoFR60.TeamMenu then
			if SERVER then
				net.Start( "Mairem:OpenMenu" )
				net.Send( called )
			end
			DarkRP.log( called:Nick() .. " (" .. called:SteamID() .. ") "..enzoFR60.LanguageOpenMenuNMaire)
			DarkRP.notify( called, 0, 4, enzoFR60.LanguageOpenMenuDMaire )
		else
			DarkRP.notify( called, 1, 5, enzoFR60.LanguagePlyNoMayor )
		end
	end
end

function ENT:OnRemove()
	if not IsValid(self) then return end
end