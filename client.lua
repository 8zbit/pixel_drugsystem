----------------------------------
---- Napisano przez: .px#5718 ----
---- Dla: ParadiseRP          ----
----------------------------------


ESX = nil
local ped = GetPlayerPed(-1)
local myJob 					= nil
local PlayerData 				= {}
local GUI 						= {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local color = { r = 220, g = 220, b = 220, alpha = 255 } 
local font = 6 
local time = 1000 
local background = {
    enable = false, 
    color = { r = 99, g = 52, b = 133, alpha = 200 },
}
local dropShadow = false
local wykonuje = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)


AddEventHandler('pixel_drugsystem:hasExitedMarker', function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)


AddEventHandler('pixel_drugsystem:hasEnteredMarker', function(zone)
	if zone == 'Jeden' then
		if myJob ~= "police" then
			CurrentAction     = 'pierwszy_etap'
			CurrentActionMsg  = "Naciśnij E aby gotować metamfetaminę"
			CurrentActionData = {}
		end
	end
	if zone == 'Dwa' then
		if myJob ~= "police" then
			CurrentAction     = 'drugi_etap'
			CurrentActionMsg  = "Naciśnij E aby gotować metamfetaminę"
			CurrentActionData = {}
		end
    end
	if zone == 'Trzy' then
		if myJob ~= "police" then
			CurrentAction     = 'trzeci_etap'
			CurrentActionMsg  = "Naciśnij E aby gotować metamfetaminę"
			CurrentActionData = {}
		end
    end
	if zone == 'Cztery' then
		if myJob ~= "police" then
			CurrentAction     = 'czwarty_etap'
			CurrentActionMsg  = "Naciśnij E aby gotować metamfetaminę"
			CurrentActionData = {}
		end
	end
    if zone == 'Magazyn' then
		if myJob ~= "police" then
			
				CurrentAction     = 'magazyn'
				CurrentActionMsg  = "Naciśnij E aby otworzyć Menu"
				CurrentActionData = {}
			
		end
    end
    if zone == 'Apteka' then
		if myJob ~= "police" then
			
				CurrentAction     = 'apteka'
				CurrentActionMsg  = "Naciśnij E aby otworzyć Menu"
				CurrentActionData = {}
			
		end
    end
    if zone == 'KokaZbierz1' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_jeden'
				CurrentActionMsg  = "Naciśnij E aby zbierać liście kokainy"
				CurrentActionData = {}
			
		end
    end
    if zone == 'KokaZbierz2' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_jeden'
				CurrentActionMsg  = "Naciśnij E aby zbierać liście kokainy"
				CurrentActionData = {}
			
		end
    end
    if zone == 'KokaZbierz3' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_jeden'
				CurrentActionMsg  = "Naciśnij E aby zbierać liście kokainy"
				CurrentActionData = {}
			
		end
    end
    if zone == 'SandyBenzyna' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_dwa'
				CurrentActionMsg  = "Naciśnij E aby namoczyć liście benzyną"
				CurrentActionData = {}
			
		end
    end
    if zone == 'SandyRozp' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_trzy'
				CurrentActionMsg  = "Naciśnij E aby oczyścić kokainę"
				CurrentActionData = {}
			
		end
    end
    if zone == 'SandyPak' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_cztery'
				CurrentActionMsg  = "Naciśnij E aby spakować kokainę"
				CurrentActionData = {}
			
		end
    end
    if zone == 'SandyWezB' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_wez_benzyne'
				CurrentActionMsg  = "Naciśnij E aby wziąć benzynę"
				CurrentActionData = {}
			
		end
    end
    if zone == 'SandyWezR' then
		if myJob ~= "police" then
			
				CurrentAction     = 'koka_wez_rozpuszczalnik'
				CurrentActionMsg  = "Naciśnij E aby wziąć rozpuszczalnik"
				CurrentActionData = {}
			
		end
    end
    if zone == 'HeroinaMak' then
		if myJob ~= "police" then
			
				CurrentAction     = 'HeroinaMak'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'HeroinaPrzerob' then
		if myJob ~= "police" then
			
				CurrentAction     = 'HeroinaPrzerob'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'HeroinaPakuj' then
		if myJob ~= "police" then
			
				CurrentAction     = 'HeroinaPakuj'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'MarihuanaZbierz' then
		if myJob ~= "police" then
			
				CurrentAction     = 'MarihuanaZbierz'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'MarihuanaPrzerob' then
		if myJob ~= "police" then
			
				CurrentAction     = 'MarihuanaPrzerob'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'LSDZbierz' then
		if myJob ~= "police" then
			
				CurrentAction     = 'LSDZbierz'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
    if zone == 'LSDPrzerob' then
		if myJob ~= "police" then
			
				CurrentAction     = 'LSDPrzerob'
				CurrentActionMsg  = "Naciśnij E aby wejść w interakcję"
				CurrentActionData = {}
			
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(5)
        sleep = true
        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

		for k,v in pairs(Config.Zones) do
            if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
                DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.75, 0.75, 0.75, 255, 0, 0, 100, false, true, 2, false, false, false, false)
                sleep = false
            end
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.OdlegloscOdMarkera) then
				DrawText3D(v.x, v.y, v.z, CurrentActionMsg)
				isInMarker  = true
                currentZone = k
			end
        end
        

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('pixel_drugsystem:GetUserJob', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('pixel_drugsystem:hasExitedMarker', lastZone)
        end

        if sleep then
            Wait(2000)
        end

    end
end)

RegisterNetEvent('pixel_drugsystem:ReturnJob')
AddEventHandler('pixel_drugsystem:ReturnJob', function(jobName, currentZone)
    myJob         = jobName
    TriggerEvent('pixel_drugsystem:hasEnteredMarker', currentZone)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if CurrentAction ~= nil then
          
            --SetTextComponentFormat('STRING')
            --AddTextComponentString(CurrentActionMsg)
           -- DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'pierwszy_etap' then
                    TriggerServerEvent('pixel_drugsystem:pierwszy_etap')
                end
                if CurrentAction == 'drugi_etap' then
                    TriggerServerEvent('pixel_drugsystem:drugi_etap')
                end
                if CurrentAction == 'trzeci_etap' then
                    TriggerServerEvent('pixel_drugsystem:trzeci_etap')
                end
                if CurrentAction == 'czwarty_etap' then
                    TriggerServerEvent('pixel_drugsystem:czwarty_etap')
                end
                if CurrentAction == 'koka_jeden' then
                    TriggerServerEvent('pixel_drugsystem:koka_zbieranie')
                end
                if CurrentAction == 'koka_dwa' then
                    TriggerServerEvent('pixel_drugsystem:koka_dodaniebenzyny')
                end
                if CurrentAction == 'koka_trzy' then
                    TriggerServerEvent('pixel_drugsystem:koka_dodanierozpuszczalnika')
                end
                if CurrentAction == 'koka_cztery' then
                    TriggerServerEvent('pixel_drugsystem:koka_pakowanie')
                end
                if CurrentAction == 'koka_wez_rozpuszczalnik' then
                    TriggerServerEvent('pixel_drugsystem:wez_rozpuszczalnik')
                end
                if CurrentAction == 'koka_wez_benzyne' then
                    TriggerServerEvent('pixel_drugsystem:wez_benzyne')
                end
                if CurrentAction == 'HeroinaMak' then
                    TriggerServerEvent('pixel_drugsystem:heroin_poppy')
                end
                if CurrentAction == 'HeroinaPrzerob' then
                    TriggerServerEvent('pixel_drugsystem:heroin_refine')
                end
                if CurrentAction == 'HeroinaPakuj' then
                    TriggerServerEvent('pixel_drugsystem:heroin_packing')
                end
                if CurrentAction == 'MarihuanaZbierz' then
                    TriggerServerEvent('pixel_drugsystem:weed_zrywanie')
                end
                if CurrentAction == 'MarihuanaPrzerob' then
                    TriggerServerEvent('pixel_drugsystem:weed_makeblunt')
                end
                if CurrentAction == 'LSDZbierz' then
                    TriggerServerEvent('pixel_drugsystem:lsd_farm')
                end
                if CurrentAction == 'LSDPrzerob' then
                    TriggerServerEvent('pixel_drugsystem:lsd_pooch')
                end
                CurrentAction = nil
            end
        else
            Wait(1000)
        end
        
    end
end)

function DrawText3D(x,y,z, text)
	
	local z = z+0.5
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, font)
		local width = EndTextCommandGetWidth(font)
		

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)

        if background.enable then
            DrawRect(_x, _y+scale/50, 0.13, height, background.color.r, background.color.g, background.color.b , background.color.alpha)
        end
	end
end

RegisterNetEvent('pixel_drugsystem:odswiezanko')
AddEventHandler('pixel_drugsystem:odswiezanko', function()
    hasAlreadyEnteredMarker = false
    CurrentAction = nil
end)

RegisterNetEvent('pixel_drugsystem:slaba_etap1')
AddEventHandler('pixel_drugsystem:slaba_etap1', function()
    exports['mythic_progbar']:Progress({
        name = "slaba_jeden",
        duration = 15000,
        label = 'Gotujesz metamfetaminę',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:pakowanie')
AddEventHandler('pixel_drugsystem:pakowanie', function()

    exports['mythic_progbar']:Progress({
        name = "pakowanko",
        duration = 5000,
        label = 'Pakujesz metamfetaminę',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_missheist_ornatebank",
            anim = "stand_cash_in_bag_loop",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)
    wykonuje = false
end)

RegisterNetEvent('pixel_drugsystem:koka_zbieranie')
AddEventHandler('pixel_drugsystem:koka_zbieranie', function()
    exports['mythic_progbar']:Progress({
        name = "slaba_jeden",
        duration = 5000,
        label = 'Zbierasz liście kokainy',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerServerEvent('pixel_drugsystem:koka_zbieraniee')
            TriggerServerEvent('pixel_drugsystem:koka_zbierz')
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_benzyna')
AddEventHandler('pixel_drugsystem:koka_benzyna', function()
    exports['mythic_progbar']:Progress({
        name = "slaba_jeden",
        duration = 2000,
        label = 'Zalewasz liście benzyną',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_benzyna_przesiakanie')
AddEventHandler('pixel_drugsystem:koka_benzyna_przesiakanie', function()
    exports['mythic_progbar']:Progress({
        name = "koka_benzyna_przesiakanie",
        duration = 5000,
        label = 'Czekasz aż liście nasiąkną',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_benzyna_odparowywanie')
AddEventHandler('pixel_drugsystem:koka_benzyna_odparowywanie', function()
    exports['mythic_progbar']:Progress({
        name = "koka_odparowywanie_benzyna",
        duration = 3000,
        label = 'Odparowywujesz benzyne z kokainy',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)


RegisterNetEvent('pixel_drugsystem:koka_rozpuszczalnik')
AddEventHandler('pixel_drugsystem:koka_rozpuszczalnik', function()
    exports['mythic_progbar']:Progress({
        name = "slaba_jeden",
        duration = 2000,
        label = 'Zalewasz liście rozpuszczalnikiem',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_rozpuszczalnik_przesiakanie')
AddEventHandler('pixel_drugsystem:koka_rozpuszczalnik_przesiakanie', function()
    exports['mythic_progbar']:Progress({
        name = "koka_benzyna_przesiakanie",
        duration = 5000,
        label = 'Czekasz na oczyszczenie kokainy',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_rozpuszczalnik_odparowywanie')
AddEventHandler('pixel_drugsystem:koka_rozpuszczalnik_odparowywanie', function()
    exports['mythic_progbar']:Progress({
        name = "koka_odparowywanie_benzyna",
        duration = 2000,
        label = 'Odparowywujesz rozpuszczalnik',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:koka_pakowanko')
AddEventHandler('pixel_drugsystem:koka_pakowanko', function()

    exports['mythic_progbar']:Progress({
        name = "pakowanko",
        duration = 3000,
        label = 'Pakujesz kokainę',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)
    wykonuje = false
end)

RegisterNetEvent('pixel_drugsystem:heroin_getopium')
AddEventHandler('pixel_drugsystem:heroin_getopium', function()
    exports['mythic_progbar']:Progress({
        name = "heroina_jeden",
        duration = 5000,
        label = 'Zbierasz opium z maku',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:heroin_refineopium')
AddEventHandler('pixel_drugsystem:heroin_refineopium', function()
    exports['mythic_progbar']:Progress({
        name = "heroina_dwa",
        duration = 10000,
        label = 'Oczyszczasz opium',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:heroin_packit')
AddEventHandler('pixel_drugsystem:heroin_packit', function()

    exports['mythic_progbar']:Progress({
        name = "heroina_trzy",
        duration = 5000,
        label = 'Pakujesz heroinę',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)
end)

RegisterNetEvent('pixel_drugsystem:weed_getweed')
AddEventHandler('pixel_drugsystem:weed_getweed', function()
    exports['mythic_progbar']:Progress({
        name = "heroina_jeden",
        duration = 5000,
        label = 'Zrywasz kulkę z krzaka',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:weed_skrecblanta')
AddEventHandler('pixel_drugsystem:weed_skrecblanta', function()

    exports['mythic_progbar']:Progress({
        name = "heroina_trzy",
        duration = 10000,
        label = 'Skręcasz blanta',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)
end)

RegisterNetEvent('pixel_drugsystem:lsd_farmlsd')
AddEventHandler('pixel_drugsystem:lsd_farmlsd', function()
    exports['mythic_progbar']:Progress({
        name = "lsd_jeden",
        duration = 5000,
        label = 'Zbierasz LSD',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)

end)

RegisterNetEvent('pixel_drugsystem:lsd_pakowanie')
AddEventHandler('pixel_drugsystem:lsd_pakowanie', function()

    exports['mythic_progbar']:Progress({
        name = "lsd_dwa",
        duration = 10000,
        label = 'Pakujesz LSD',
        useWhileDead = true,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_v4_coccutter",
            flags = 49,
        },
    }, function(cancelled)
        if not cancelled then
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
           -- hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        else
            TriggerEvent('pixel_drugsystem:odswiezanko')
            wykonuje = false
            --hasAlreadyEnteredMarker = false
           -- CurrentAction             = nil
        end
    end)
end)