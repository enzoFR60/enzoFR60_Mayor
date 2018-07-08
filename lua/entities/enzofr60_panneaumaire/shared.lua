include("autorun/sh_config_enzofr60_mayor.lua")

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = enzoFR60.LanguageSignMayor
ENT.Author = "enzofr60"
ENT.Spawnable = true
ENT.Category = "enzofr60 Maire"

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
end