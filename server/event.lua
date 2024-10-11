ESX.RegisterServerCallback('logic:hasRequirements', function(source, cb, requirements)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if #(playerCoords - vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z)) <= 5 then

        for itemName, itemData in pairs(requirements) do
            local itemQuantity = playerObject.getInventoryItem(itemName)?.count

            if itemQuantity and itemQuantity <= itemData.Quantity or not itemQuantity then
                TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez pas assez de ' .. itemData.Label:lower() .. ' pour craft cette arme.')
                cb(false)
                return
            end
        end

        cb(true)
    else
        cb(false)
        DropPlayer(_source, 'Vous avez été détecté pour cheat.')
    end
end)

RegisterNetEvent('logic:craftWeapon', function(weaponName, requirements)
    local _source = source
    local playerObject = ESX.GetPlayerFromId(_source)
    local playerCoords = GetEntityCoords(GetPlayerPed(_source))

    if playerObject then
        if #(playerCoords - vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z)) <= 5 then
            for itemName, itemData in pairs(requirements) do
                playerObject.removeInventoryItem(itemName, itemData.Quantity)
            end

            playerObject.addInventoryItem(weaponName, 1)
        else
            DropPlayer(_source, 'Vous avez été détecté pour cheat.')
        end
    end
end)