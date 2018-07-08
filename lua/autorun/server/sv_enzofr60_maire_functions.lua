util.AddNetworkString("Mairem:OpenMenu")
util.AddNetworkString("Mairem:MenuLaw:OpenMenu")
util.AddNetworkString("Mairem:Settings:OpenMenu")
util.AddNetworkString("Mairem:MenuLaw:OpenMenuLaw1")
util.AddNetworkString("Mairem:MenuLaw:OpenMenuLaw2")
util.AddNetworkString("Mairemenu:Open:ChangeRegime")
util.AddNetworkString("Mairemenu:Open:Settings")
util.AddNetworkString("Mairemenu:ChangeRegime")
util.AddNetworkString("Mairemenu:ChangeSettings")

concommand.Add( enzoFR60.mcommandmenumaire, function( Ply, cmd, args )
	if enzoFR60.MAMayor[Ply:GetUserGroup()] then
		if enzoFR60.openmenu || enzoFR60.openmenu == nil then
			if SERVER then
				net.Start( "Mairem:OpenMenu" )
				net.Send( Ply )
				DarkRP.log( Ply:Nick() .. " (" .. Ply:SteamID() .. ") "..enzoFR60.LanguageOpenMenuNMaire  )
			end
		end
	end
end )

net.Receive("Mairem:MenuLaw:OpenMenuLaw1", function( len, Ply )
	if Ply:Team() == enzoFR60.TeamMenu then
	if enzoFR60.openmenu || enzoFR60.openmenu == nil then
		local ouiyes = net.ReadString()
		if ouiyes == "ouiyes" then
			if SERVER then
				net.Start( "Mairem:MenuLaw:OpenMenu" )
				net.WriteString("ouiyes")
				net.Send( Ply )
			end
		end
	end
	end
end)

net.Receive("Mairem:MenuLaw:OpenMenuLaw2", function( len, Ply )
	if Ply:Team() == enzoFR60.TeamMenu then
	if enzoFR60.openmenu || enzoFR60.openmenu == nil then
		local nonno = net.ReadString()
		if nonno == "nonno" then
			if SERVER then
				net.Start( "Mairem:MenuLaw:OpenMenu" )
				net.WriteString("nonno")
				net.Send( Ply )
			end	
		end
	end
	end
end)

net.Receive("Mairemenu:ChangeSettings", function( len, Ply )
	if enzoFR60.MAMayor[Ply:GetUserGroup()] then
	if enzoFR60.openmenu || enzoFR60.openmenu == nil then
		if SERVER then
			net.Start( "Mairem:Settings:OpenMenu" )
			net.Send( Ply )
		end
	end
	end
end)


net.Receive("Mairemenu:Open:Settings", function( len, Ply )
	if enzoFR60.MAMayor[Ply:GetUserGroup()] then
	if enzoFR60.openmenu || enzoFR60.openmenu == nil then
		local yesno = net.ReadString( 50 )
		SetGlobalString( "enzoFR60.PanOpenMenuYesNo", yesno )
	end
	end
end)

net.Receive("Mairemenu:Open:ChangeRegime", function( len, Ply )
	if Ply:Team() == enzoFR60.TeamMenu then
	if enzoFR60.openmenu || enzoFR60.openmenu == nil then
		if SERVER then
			net.Start( "Mairem:OpenMenu" )
			net.Send( Ply )
			DarkRP.log( Ply:Nick() .. " (" .. Ply:SteamID() .. ") "..enzoFR60.LanguageOpenMenuNMaire)
			DarkRP.notify( Ply, 0, 4, enzoFR60.LanguageOpenMenuDMaire )
		end
	end
	else
		DarkRP.notify( Ply, 1, 5, enzoFR60.LanguagePlyNoMayor )
	end
end)

net.Receive("Mairemenu:ChangeRegime", function( len, Ply )
			local maire = net.ReadString( 50 )
			local temps = net.ReadFloat( 20 )
			
			
			DarkRP.log( Ply:Nick() .. " (" .. Ply:SteamID() .. ") "..enzoFR60.LanguageChangeLRegime.. " "..maire  )
			
			DarkRP.notify( Ply, 0, 4, enzoFR60.LanguageChangePlyRegime.." "..maire..", "..enzoFR60.LanguageChangePlyRegimeTime..temps..enzoFR60.LanguageChangePlyRegimeTimee )
				
			SetGlobalString( 69584588785, enzoFR60.LanguageRegimeComing )
			
			timer.Simple(temps, function() 
				SetGlobalString( 69584588785, maire )
				
				for k, v in pairs(player.GetAll()) do
			
					DarkRP.notify( v, 0, 4, enzoFR60.LanguageChangeVRegime.." "..maire )
			
				end
			end)
end)