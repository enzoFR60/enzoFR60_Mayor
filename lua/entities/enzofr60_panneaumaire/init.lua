AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

include("autorun/sh_config_enzofr60_mayor.lua")

function ENT:Initialize()
	self:SetModel("models/props/cs_assault/billboard.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:SetUseType( SIMPLE_USE )
	self.CanUse = true
	self:SetNWInt("distance", 1200);
	self:SetNWFloat("distance", 1200);

end

function ENT:AcceptInput( Name, Activator, Caller )
end

function ENT:OnRemove()
	if not IsValid(self) then return end
end