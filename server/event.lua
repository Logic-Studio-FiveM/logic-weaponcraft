ESX.RegisterServerCallback('logic:hasRequirements', function(source, cb, requirements)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if not playerObject then
        return
    end

    if #(playerCoords - vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z)) >= 15 then
        DropPlayer(_source, Config.Strings.CheatDetected)
        local message = ("**%s** a été détecté pour cheat. \n**ID:** ```%s```\n**Position:** ```%s```\n**License:** ```%s```\n**IP**: ```%s```"):format(GetPlayerName(_source), _source, json.encode(playerCoords), GetPlayerIdentifierByType(_source, 'steam'), GetPlayerEndpoint(_source))
        queueWebhook(Config.Webhook.Cheat, 'red', 'Cheat détecté', message, "Logic Studios")
        cb(false)
        return
    end

    for itemName, itemData in pairs(requirements) do
        local itemQuantity = playerObject.getInventoryItem(itemName)?.count

        if itemQuantity and itemQuantity <= itemData.Quantity or not itemQuantity then
            TriggerClientEvent('ox_lib:notify', _source, {
                title = 'Action impossible',
                description = string.format(Config.Strings.Requirements, itemData.Label:lower()),
                duration = 5000,
                type = 'error'
            })
            cb(false)
            return
        end
    end

    cb(true)
end)

RegisterNetEvent('logic:craftWeapon', function(weaponName, requirements)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if not playerObject then
        return
    end

    if #(playerCoords - vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z)) >= 15 then
        DropPlayer(_source, Config.Strings.CheatDetected)
        local message = ("**%s** a été détecté pour cheat. \n**ID:** ```%s```\n**Position:** ```%s```\n**License:** ```%s```\n**IP**: ```%s```"):format(GetPlayerName(_source), _source, json.encode(playerCoords), GetPlayerIdentifierByType(_source, 'steam'), GetPlayerEndpoint(_source))
        queueWebhook(Config.Webhook.Cheat, 'red', 'Cheat détecté', message, "Logic Studios")
        return
    end

    for itemName, itemData in pairs(requirements) do
        playerObject.removeInventoryItem(itemName, itemData.Quantity)
    end

    playerObject.addInventoryItem(weaponName, 1)

    local message = ("**%s** a craft l'arme **%s**.\n**ID:** ```%s```\n**Position:** ```%s```\n**License:** ```%s```\n**IP**: ```%s```"):format(GetPlayerName(_source), weaponName, _source, json.encode(playerCoords), GetPlayerIdentifierByType(_source, 'steam'), GetPlayerEndpoint(_source))
    queueWebhook(Config.Webhook.Crafting, 'green', 'Craft d\'arme', message, "Logic Studios")
end)

RegisterNetEvent('logic:pickupItem', function(itemName, quantity, position)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if not playerObject then
        return
    end

    if #(playerCoords - position) >= 15 then
        DropPlayer(_source, Config.Strings.CheatDetected)
        return
    end

    playerObject.addInventoryItem(itemName, quantity)
    
    local message = ("**%s** a récupéré **%s** **%s**.\n**ID:** ```%s```\n**Position:** ```%s```\n**License:** ```%s```\n**IP**: ```%s```"):format(GetPlayerName(_source), quantity, itemName, _source, json.encode(playerCoords), GetPlayerIdentifierByType(_source, 'steam'), GetPlayerEndpoint(_source))
    sendLog(Config.Webhook.Farming, 'blue', 'Récolte', message, "Logic Studios")
end)