ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



function Policja()

	local xPlayers = ESX.GetPlayers()

	ilosc = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			ilosc = ilosc + 1
		end
	end

end

RegisterServerEvent('pixel_drugsystem:GetUserJob')
AddEventHandler('pixel_drugsystem:GetUserJob', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('pixel_drugsystem:ReturnJob', _source, xPlayer.job.name, currentZone)
end)

RegisterServerEvent('pixel_drugsystem:KupPrzedmiot')
AddEventHandler('pixel_drugsystem:KupPrzedmiot', function(itemName, price)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  if xPlayer.get('money') >= price then
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem(itemName, 1)


  else
    TriggerClientEvent("esx:showNotification", _source, "Masz za malo pieniedzy.")
  end

end)


RegisterServerEvent('pixel_drugsystem:pierwszy_etap')
AddEventHandler('pixel_drugsystem:pierwszy_etap', function()
  local _source = source


  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local fenyloaceton = xPlayer.getInventoryItem("fenyloaceton")["count"]
  local dimetyloformamid = xPlayer.getInventoryItem("dimetyloformamid")["count"]
  if fenyloaceton > 1 and dimetyloformamid > 1 then
    TriggerClientEvent('pixel_drugsystem:slaba_etap1', _source)
    xPlayer.removeInventoryItem("fenyloaceton",2)
    Citizen.Wait(7500)
    xPlayer.removeInventoryItem("dimetyloformamid",2)
  Citizen.Wait(7500)
  xPlayer.addInventoryItem("diformylometamfetamina",1)
  TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
  wykonuje = false
else
  TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało: \nFenyloacetonu ("..fenyloaceton.."/2) \nDimetyloformamidu ("..dimetyloformamid.."/2)")
  wykonuje = false   
end
end


end)

RegisterServerEvent('pixel_drugsystem:drugi_etap')
AddEventHandler('pixel_drugsystem:drugi_etap', function()
  local _source = source
  

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local diformylometamfetamina = xPlayer.getInventoryItem("diformylometamfetamina")["count"]
  local kwas_solny = xPlayer.getInventoryItem("kwas_solny")["count"]
  if diformylometamfetamina > 0 and kwas_solny > 1 then
    xPlayer.removeInventoryItem("kwas_solny",2)
    xPlayer.removeInventoryItem("diformylometamfetamina",1)
  TriggerClientEvent('pixel_drugsystem:slaba_etap1', _source)
  Citizen.Wait(15000)
  xPlayer.addInventoryItem("chlorowodorek_metamfetaminy",1)
  TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
  wykonuje = false
else
  TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało: \nDiformylometamfetaminy ("..diformylometamfetamina.."/1) \nKwasu Solnego ("..kwas_solny.."/2)")
  wykonuje = false   
end
end




end)
RegisterServerEvent('pixel_drugsystem:trzeci_etap')
AddEventHandler('pixel_drugsystem:trzeci_etap', function()
  local _source = source
 

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local chlorowodorek_metamfetaminy = xPlayer.getInventoryItem("chlorowodorek_metamfetaminy")["count"]
  local wodorotlenek_sodu = xPlayer.getInventoryItem("wodorotlenek_sodu")["count"]
  if chlorowodorek_metamfetaminy > 1 and wodorotlenek_sodu > 1 then
    xPlayer.removeInventoryItem("wodorotlenek_sodu",1)
    xPlayer.removeInventoryItem("chlorowodorek_metamfetaminy",1)
  TriggerClientEvent('pixel_drugsystem:slaba_etap1', _source)
  Citizen.Wait(15000)
  xPlayer.addInventoryItem("krysztal",1)
  TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
  wykonuje = false
else
  TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało:\nWodorotlenku sodu ("..wodorotlenek_sodu.."/1) \nChlorowodorku Metamfetaminy ("..chlorowodorek_metamfetaminy.."/1)")
  wykonuje = false    
end
end


end)
RegisterServerEvent('pixel_drugsystem:czwarty_etap')
AddEventHandler('pixel_drugsystem:czwarty_etap', function()
  local _source = source
 

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local woreczek = xPlayer.getInventoryItem("woreczek")["count"]
  local krysztal = xPlayer.getInventoryItem("krysztal")["count"]
  if woreczek > 0 and krysztal > 0 then
    xPlayer.removeInventoryItem("woreczek",1)
    xPlayer.removeInventoryItem("krysztal",1)
  TriggerClientEvent('pixel_drugsystem:pakowanie', _source)
  Citizen.Wait(5000)
  xPlayer.addInventoryItem("gram_mety",1)
  TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
  wykonuje = false
else
  TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało:\nKryształu ("..krysztal.."/1)\nWoreczków ("..woreczek.."/1)")
wykonuje = false  
end
end
end)


RegisterServerEvent('pixel_drugsystem:koka_zbieranie')
AddEventHandler('pixel_drugsystem:koka_zbieranie', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('pixel_drugsystem:koka_zbieranie', _source)
    TriggerEvent('pixel_drugsystem:koka_zbierz', _source)
  end
end)

RegisterServerEvent('pixel_drugsystem:koka_zbieraniee')
AddEventHandler('pixel_drugsystem:koka_zbieraniee', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem("lisc_koki",1)
end)


RegisterServerEvent('pixel_drugsystem:koka_dodaniebenzyny')
AddEventHandler('pixel_drugsystem:koka_dodaniebenzyny', function()
  local _source = source
 

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local liscie = xPlayer.getInventoryItem("lisc_koki")["count"]
    local benzyna = xPlayer.getInventoryItem("benzyna")["count"]
    if liscie > 0 and benzyna > 0 then
      xPlayer.removeInventoryItem("lisc_koki",1)
      xPlayer.removeInventoryItem("benzyna",1)
      TriggerClientEvent('pixel_drugsystem:koka_benzyna', _source)
      Citizen.Wait(2000)
      xPlayer.addInventoryItem("koka_benzyna",1)
      TriggerClientEvent('pixel_drugsystem:koka_benzyna_przesiakanie', _source)
      Citizen.Wait(6000)
      TriggerClientEvent('pixel_drugsystem:koka_benzyna_odparowywanie', _source)
      Citizen.Wait(3000)
      xPlayer.removeInventoryItem("koka_benzyna",1)
      xPlayer.addInventoryItem("wysuszona_kokaina",1)
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)

      wykonuje = false
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało:\nLiści ("..liscie.."/20)\nBenzyny ("..benzyna.."/1)")
      wykonuje = false  
    end
  end
end)


RegisterServerEvent('pixel_drugsystem:wez_benzyne')
AddEventHandler('pixel_drugsystem:wez_benzyne', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local benzyna = xPlayer.getInventoryItem("benzyna")["count"]
    if benzyna > 4 then
      TriggerClientEvent('esx:showNotification', _source, "Posiadasz już benzyne przy sobie.")
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
    else
      xPlayer.addInventoryItem("benzyna",1)
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:wez_rozpuszczalnik')
AddEventHandler('pixel_drugsystem:wez_rozpuszczalnik', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local rozpuszczalnik = xPlayer.getInventoryItem("rozpuszczalnik")["count"]
    if rozpuszczalnik > 4 then
      TriggerClientEvent('esx:showNotification', _source, "Posiadasz już rozpuszczalnik przy sobie.")
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
    else
      xPlayer.addInventoryItem("rozpuszczalnik",1)
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:koka_dodanierozpuszczalnika')
AddEventHandler('pixel_drugsystem:koka_dodanierozpuszczalnika', function()
  local _source = source
 

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local rozpuszczalnik = xPlayer.getInventoryItem("rozpuszczalnik")["count"]
    local wysuszona_kokaina = xPlayer.getInventoryItem("wysuszona_kokaina")["count"]
    if wysuszona_kokaina > 0 and rozpuszczalnik > 0 then
      xPlayer.removeInventoryItem("wysuszona_kokaina",1)
      xPlayer.removeInventoryItem("rozpuszczalnik",1)
      TriggerClientEvent('pixel_drugsystem:koka_rozpuszczalnik', _source)
      Citizen.Wait(3000)
      TriggerClientEvent('pixel_drugsystem:koka_rozpuszczalnik_przesiakanie', _source)
      Citizen.Wait(6000)
      TriggerClientEvent('pixel_drugsystem:koka_rozpuszczalnik_odparowywanie', _source)
      Citizen.Wait(2000)
      xPlayer.addInventoryItem("oczyszczona_kokaina",1)
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)

      wykonuje = false
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz lub masz za mało:\nRozpuszczalnik ("..rozpuszczalnik.."/1)\nWysuszonej koki ("..wysuszona_kokaina.."/1)")
      wykonuje = false  
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:koka_pakowanie')
AddEventHandler('pixel_drugsystem:koka_pakowanie', function()
  local _source = source
 

  Policja()
  if ilosc < Config.LSPD then
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    wykonuje = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local oczyszczona_kokaina = xPlayer.getInventoryItem("oczyszczona_kokaina")["count"]
    if oczyszczona_kokaina > 0 then
      xPlayer.removeInventoryItem("oczyszczona_kokaina",1)
      TriggerClientEvent('pixel_drugsystem:koka_pakowanko', _source)
      Citizen.Wait(3000)
      xPlayer.addInventoryItem("coke_pooch",1)
      TriggerClientEvent('pixel_drugsystem:odswiezanko', _source)

      wykonuje = false
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie posiadasz kokainy do spakowania.")
      wykonuje = false  
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:heroin_poppy')
AddEventHandler('pixel_drugsystem:heroin_poppy', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local heroina_mak = xPlayer.getInventoryItem("heroina_mak")["count"]
    if heroina_mak < 20 then 
      TriggerClientEvent('pixel_drugsystem:heroin_getopium', _source)
      Wait(5000)
      xPlayer.addInventoryItem("heroina_mak",1)
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie możesz więcej unieść")
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:heroin_refine')
AddEventHandler('pixel_drugsystem:heroin_refine', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local heroina_mak = xPlayer.getInventoryItem("heroina_mak")["count"]
    local heroina_opium = xPlayer.getInventoryItem("heroina")["count"]
    if heroina_mak > 0 and heroina_opium < 21 then 
      TriggerClientEvent('pixel_drugsystem:heroin_refineopium', _source)
      xPlayer.removeInventoryItem("heroina_mak",1)
      Wait(10000)
      xPlayer.addInventoryItem("heroina",1)
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie możesz więcej unieść lub masz zbyt mało maku")
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:heroin_packing')
AddEventHandler('pixel_drugsystem:heroin_packing', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local heroina_opium = xPlayer.getInventoryItem("heroina")["count"]
    local heroina_pooch = xPlayer.getInventoryItem("heroina_pooch")["count"]
    if heroina_opium > 0 then 
      if heroina_pooch < 21 then
        TriggerClientEvent('pixel_drugsystem:heroin_packit', _source)
        xPlayer.removeInventoryItem("heroina",1)
        Wait(5000)
        xPlayer.addInventoryItem("heroina_pooch",1)
      else
        TriggerClientEvent("esx:showNotification", _source, 'Nie możesz więcej unieść')
      end  
    else
      TriggerClientEvent("esx:showNotification", _source, 'Nie posiadasz heroiny')
    end
  end
end)


RegisterServerEvent('pixel_drugsystem:weed_zrywanie')
AddEventHandler('pixel_drugsystem:weed_zrywanie', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local ziolo = xPlayer.getInventoryItem("weed")["count"]
    if ziolo < 41 then 
      TriggerClientEvent('pixel_drugsystem:weed_getweed', _source)
      Wait(5000)
      xPlayer.addInventoryItem("weed",1)
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie możesz więcej unieść")
    end
  end
end)


RegisterServerEvent('pixel_drugsystem:weed_makeblunt')
AddEventHandler('pixel_drugsystem:weed_makeblunt', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed = xPlayer.getInventoryItem("weed")["count"]
    local weed_pooch = xPlayer.getInventoryItem("weed_pooch")["count"]
    if weed > 1 then
      if weed_pooch < 21 then
        TriggerClientEvent('pixel_drugsystem:weed_skrecblanta', _source)
        xPlayer.removeInventoryItem("weed",2)
        Wait(10000)
        xPlayer.addInventoryItem("weed_pooch",1)
      else
        TriggerClientEvent("esx:showNotification", _source, 'Nie możesz więcej unieść')
      end
    else
      TriggerClientEvent("esx:showNotification", _source, 'Nie posiadasz marihuany')
    end
  end
end)

RegisterServerEvent('pixel_drugsystem:lsd_farm')
AddEventHandler('pixel_drugsystem:lsd_farm', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local lsd = xPlayer.getInventoryItem("lsd")["count"]
    if lsd < 41 then 
      TriggerClientEvent('pixel_drugsystem:lsd_farmlsd', _source)
      Wait(5000)
      xPlayer.addInventoryItem("lsd",1)
    else
      TriggerClientEvent("esx:showNotification", _source, "Nie możesz więcej unieść")
    end
  end
end)


RegisterServerEvent('pixel_drugsystem:lsd_pooch')
AddEventHandler('pixel_drugsystem:lsd_pooch', function()
  local _source = source
  Policja()
  if ilosc < Config.LSPD then 
    TriggerClientEvent("esx:showNotification", _source, "Za malo PD na sluzbie")
  else
    local xPlayer = ESX.GetPlayerFromId(source)
    local lsd = xPlayer.getInventoryItem("lsd")["count"]
    local lsd_pooch = xPlayer.getInventoryItem("lsd_pooch")["count"]
    if lsd > 1 then
      if lsd_pooch < 21 then
        TriggerClientEvent('pixel_drugsystem:lsd_pakowanie', _source)
        xPlayer.removeInventoryItem("lsd",2)
        Wait(10000)
        xPlayer.addInventoryItem("lsd_pooch",1)
      else
        TriggerClientEvent("esx:showNotification", _source, 'Nie możesz więcej unieść')
      end
    else
      TriggerClientEvent("esx:showNotification", _source, 'Nie posiadasz LSD')
    end
  end
end)