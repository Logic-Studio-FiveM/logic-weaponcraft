RegisterNetEvent('logic:openCraftingMenu', function()
    if not menuRegistered then
        for weaponName, weaponData in pairs(Config.Crafting.Weapons) do
            local metadata = {
                {label = Config.Menu.Metadata.TimeForCraft, value = weaponData.TimeForCraft / 1000 .. 'seconde'}
            }

            for itemName, itemData in pairs(weaponData.Requirements) do
                metadata[#metadata + 1] = {label = itemData.Label, value = itemData.Quantity .. 'x'}
            end

            options[#options + 1] = {
                title = weaponData.Title,
                icon = weaponData.Icon,
                iconColor = weaponData.IconColor,
                image = weaponData.Image,
                metadata = metadata,
                onSelect = function()
                    Logger('trace', weaponData.Title)

                    ESX.TriggerServerCallback('logic:hasRequirements', function(hasRequirements)
                        if hasRequirements then
                            FreezeEntityPosition(PlayerPedId(), true)
                            Citizen.CreateThread(function()
                                startAnimationToCraftingPed(weaponData.TimeForCraft)
                            end)
                            if lib.progressCircle({
                                duration = weaponData.TimeForCraft,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                },
                            }) then 
                                lib.requestAnimDict("mp_common")
                                TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)
                                Wait(1000)
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('logic:craftWeapon', weaponName, weaponData.Requirements) 
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                Logger('warn', 'Crafting cancelled') 
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        end
                    end, weaponData.Requirements)
                end
            }
        
            Logger('trace', "Weapon options added for " .. weaponName)
        end

        registerMenu()
    end

    lib.showContext('logic:craftingMenu')
end)