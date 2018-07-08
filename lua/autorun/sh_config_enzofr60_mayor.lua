enzoFR60 = enzoFR60 or {}

-- true = FR : vous activez. ENG : you activate
-- false = FR : vous desactivez. ENG : you deactivate

enzoFR60.openmenum = true -- Don't Touch

enzoFR60.SelectedLanguage = "fr" -- en = english , fr = french

enzoFR60.PanOpenMenu = true -- true = oui, false = nan

enzoFR60.mcommandmenumaire = "mmayor" -- Nom de la commande pour ouvrir le menu dans la console, Name of the command to open the menu in console

enzoFR60.TeamMenu = TEAM_MAYOR -- Nom du metier, name of job

enzoFR60.MAMayor = { ["superadmin"] = true, ["admin"] = true } -- Groupe autorisée au menu admin maire, Allowed group in the mayor's menu admin

-- Language config

if (enzoFR60.SelectedLanguage == "en") then

 enzoFR60.LanguageHours = "Hours"

 enzoFR60.LanguageMinutes = "Minutes"

 enzoFR60.LanguageChangeregime = "Change the political regime"
 
 enzoFR60.LanguageChangeSettings = "Change"

 enzoFR60.LanguageListMaire = "List of political regime"

 enzoFR60.LanguageHello = "Hello"
 
 enzoFR60.LanguageDemocracy = "Democracy"
 
 enzoFR60.LanguageDictatorship = "Dictatorship"
 
 enzoFR60.LanguageRegime = "Regime"
 
 enzoFR60.LanguageRegimeComing = "Coming soon"
 
 enzoFR60.LanguageConfig = "Configuration :"
 
 enzoFR60.LanguageTempConfig = "Time before change : "
 
 enzoFR60.LanguageMayor = "Mayor"
 
 enzoFR60.LanguageDontMayor = "No Mayor"
 
 enzoFR60.LanguageComputerMayor = "Mayor's Computer"
 
 enzoFR60.LanguagePopulation = "Population"
 
 enzoFR60.LanguageSignMayor = "Political Regime Sign"
 
 enzoFR60.LanguageAddLaw = "Add Law"
 
 enzoFR60.LanguageRemoveLaw = "Delete Law"
 
 enzoFR60.LanguageAddLawDesc = "Description ?"
 
 enzoFR60.LanguageRemoveLawDesc = "Number ?"
 
 enzoFR60.LanguageActiver = "Enable the change of plan option?"
 
 enzoFR60.LanguageYes = "Yes"
 
 enzoFR60.LanguageNo = "No"
 
 enzoFR60.LanguageOrdi = "Computeur"
 
 -- Notif Darkrp and logs
 
 enzoFR60.LanguageOpenMenuDMaire = "You've just opened the mayor's menu!"

 enzoFR60.LanguageOpenMenuNMaire = "opened the mayor menu's "
 
 enzoFR60.LanguagePlyNoMayor = "You are not a mayor"
 
 enzoFR60.LanguageChangePlyRegime = "you have to change the political regime by"
 
 enzoFR60.LanguageChangePlyRegimeTime = "You put "
 
 enzoFR60.LanguageChangePlyRegimeTimee = " seconds before publication"
 
 enzoFR60.LanguageChangeVRegime = "The Mayor to change the political regime by"

 enzoFR60.LanguageChangeLRegime = "to change the political regime by"

elseif (enzoFR60.SelectedLanguage == "fr") then

 enzoFR60.LanguageHours = "Heures"

 enzoFR60.LanguageMinutes = "Minutes"
 
 enzoFR60.LanguageConfig = "Configuration :"
 
 enzoFR60.LanguageTempConfig = "Temps avant le changement : "

 enzoFR60.LanguageChangeregime = "Changer le regime"

 enzoFR60.LanguageListMaire = "Liste des régimes politique"

 enzoFR60.LanguageHello = "Bonjour"
 
 enzoFR60.LanguageDemocracy = "Democratie"
 
 enzoFR60.LanguageDictatorship = "Dictature"
 
 enzoFR60.LanguageRegime = "Regime"
 
 enzoFR60.LanguageDontMayor = "Pas De Maire"
 
 enzoFR60.LanguageMayor = "Maire"
 
 enzoFR60.LanguageComputerMayor = "Ordinateur Du"
 
 enzoFR60.LanguageRegimeComing = "En cours"
 
 enzoFR60.LanguageSignMayor = "Panneau Regime Politique"
 
 enzoFR60.LanguagePopulation = "Population"
 
 enzoFR60.LanguageAddLaw = "Ajouter Une Loi"
 
 enzoFR60.LanguageRemoveLaw = "Supprimer Une Loi"
 
 enzoFR60.LanguageAddLawDesc = "Description ?"
 
 enzoFR60.LanguageRemoveLawDesc = "Numéro ?"
 
 enzoFR60.LanguageActiver = "Activer l'option changer de regime ?"
 
 enzoFR60.LanguageYes = "Oui"
 
 enzoFR60.LanguageNo = "Non"
 
 enzoFR60.LanguageChangeSettings = "Changer"
 
 enzoFR60.LanguageOrdi = "Pc"
 
 -- Notif Darkrp et logs
 
 enzoFR60.LanguageOpenMenuDMaire = "Tu vien d'ouvrir le menu du maire !"

 enzoFR60.LanguageOpenMenuNMaire = "a ouvert le menu du maire "

 enzoFR60.LanguageChangePlyRegime = "tu a changer le regime politique par"
 
 enzoFR60.LanguageChangePlyRegimeTime = "Vous avez mis "
 
 enzoFR60.LanguageChangePlyRegimeTimee = " secondes avant la publication"
 
 enzoFR60.LanguagePlyNoMayor = "Tu n'est point maire"
 
 enzoFR60.LanguageChangeVRegime = "Le Directeur a changer le regime politique par"
 
 enzoFR60.LanguageChangeLRegime = "a changer le regime politique par"
 
end