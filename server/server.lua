local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("as-licensing:lHandlerQB", function(licenseResult, busName, licenseName, expiryDate)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {
        firstname = Player.PlayerData.charinfo.firstname,
        lastname = Player.PlayerData.charinfo.lastname,
        busname = licenseResult.busName,
        licensename = licenseResult.licenseName,
        expirydate = licenseResult.expiryDate,
    }

    Player.Functions.AddItem("alcohollicense", 1, nil, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["alcohollicense"], 'add')
end)

RegisterNetEvent("as-licensing:lHandlerOX", function( busName, licenseName, expiryDate)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {
        busname = busName,
        licensename = licenseName,
        firstname = Player.PlayerData.charinfo.firstname,
        lastname = Player.PlayerData.charinfo.lastname,
        expirydate = expiryDate
    }

    Player.Functions.AddItem("alcohollicense", 1, nil, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["alcohollicense"], 'add')
end)