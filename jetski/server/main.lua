ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jetski:rent')
AddEventHandler('jetski:rent', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Config.Price then
        xPlayer.removeMoney(Config.Price)
        TriggerClientEvent('jetski:spawn', source)
    else
        TriggerClientEvent('jetski:notify', source, 'Pas assez d\'argent')
    end
end)
