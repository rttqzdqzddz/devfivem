ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local renting = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local dist = #(playerCoords - Config.RentalLocation)

        if dist < 3.0 and not renting then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour louer un JetSki (~g~"..Config.Price.."$~s~)")
            if IsControlJustReleased(0, 38) then
                TriggerServerEvent('jetski:rent')
            end
        end
    end
end)

RegisterNetEvent('jetski:spawn')
AddEventHandler('jetski:spawn', function()
    renting = true
    ESX.Game.SpawnVehicle('seashark', Config.SpawnLocation, Config.SpawnLocation.w, function(vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end)
end)

RegisterNetEvent('jetski:notify')
AddEventHandler('jetski:notify', function(msg)
    ESX.ShowNotification(msg)
end)
