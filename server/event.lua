ESX.RegisterServerCallback('logic:hasRequirements', function(source, cb, requirements)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if not playerObject then
        return
    end

    if #(playerCoords - vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z)) >= 15 then
        DropPlayer(_source, 'Vous avez été détecté pour cheat.')
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
        DropPlayer(_source, 'Vous avez été détecté pour cheat.')
        return
    end

    for itemName, itemData in pairs(requirements) do
        playerObject.removeInventoryItem(itemName, itemData.Quantity)
    end

    playerObject.addInventoryItem(weaponName, 1)
end)

RegisterNetEvent('logic:pickupItem', function(itemName, quantity, position)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if not playerObject then
        return
    end

    if #(playerCoords - position) >= 15 then
        --DropPlayer(_source, 'Vous avez été détecté pour cheat.')
        print(#(playerCoords - vec3(position.x, position.y, position.z)))
        print(playerCoords, position)
        print("Vous avez été détecté pour cheat.")
        return
    end

    playerObject.addInventoryItem(itemName, quantity)
end)