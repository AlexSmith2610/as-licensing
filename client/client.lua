local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("as-licensing:licensingmenu", function()
    local licenseResult = nil
    if Config.MenuType == "qb" then
    licenseResult = exports['qb-input']:ShowInput({
        header = "Alcohol Licensing",
        submitText = "Submit",
        inputs = {
            {
                text = "Business Name", -- text you want to be displayed as a place holder
                name = "busName", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "License Owner",
                name = "licenseName",
                type = "text",
                isRequired = true,
            },
            {
                text = "Expiry Date",
                name = "expiryDate",
                type = "text",
                isRequired = true,
            },
        }
    })

    if licenseResult ~= nil then
        if not licenseResult.busName == nil then
            QBCore.Functions.Notify('You must enter a business name', 'primary')
            return
        elseif not licenseResult.licenseName == nil then
            QBCore.Functions.Notify('You must enter a license owner', 'primary')
            return
        elseif not licenseResult.expiryDate == nil then
            QBCore.Functions.Notify('You must enter an expiry date', 'primary')
            return
        end
        TriggerServerEvent("as-licensing:lHandlerQB", licenseResult)
    end

    else if Config.MenuType == "ox" then
        local license = lib.inputDialog('Alcohol Licensing', {
            {type = 'input', label = 'Business Name', required = true, icon = 'shopping-cart'},
            {type = 'input', label = 'License Owner', required = true, icon = 'id-card'},
            {type = 'input', label = 'Expiry Date',   required = false, icon = 'hourglass-start'},
        })
        if not license then return end

        if license[1] ~= nil then
            if not license[1] == nil then
                QBCore.Functions.Notify('You must enter a business name', 'primary')
                return
            elseif not license[2] == nil then
                QBCore.Functions.Notify('You must enter a license owner', 'primary')
                return
            elseif not license[3] == nil then
                QBCore.Functions.Notify('You must enter an expiry date', 'primary')
                return
            end
            TriggerServerEvent("as-licensing:lHandlerOX", license[1], license[2], license[3])
        end
    end
end
end)

if Config.TriggerType == "cmd" then
    TriggerEvent('chat:addSuggestion', '/licensing', 'Alcohol Licensing Menu')
    RegisterCommand('licensing', function()
        local Player = QBCore.Functions.GetPlayerData()
        local jobName = Player.job.name
        if jobName == Config.LicensingJobs then
            TriggerEvent("as-licensing:licensingmenu")
        else
            QBCore.Functions.Notify('You are not allowed to do that!', 'primary')
        end
    end)
elseif Config.TriggerType == "ped" then
    exports['qb-target']:SpawnPed({
        model = 'mp_m_waremech_01',
        coords = Config.PedLocation,
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            useModel = false,
            options = {
                {
                num = 1,
                type = "client",
                event = "as-licensing:licensingmenu",
                icon = 'fas fa-address-book',
                label = 'Alcohol Licensing',
                job = Config.LicensingJobs,
                }
            },
            distance = 3.5,
        },
    })
end