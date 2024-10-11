local cachePed = nil
local targetCreated = false

--- Create the target for the crafting ped
local function createTarget()
    if not targetCreated then
        exports.ox_target:addBoxZone({
            name = 'logic:craftingTarget',
            coords = vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z),
            size = vec3(1, 1, 7),
            rotation = 45,
            drawSprite = Config.Target.DrawSprite,
            options = {
                {
                    label = Config.Target.Name,
                    icon = Config.Target.Icon,
                    distance = Config.Target.Distance,
                    onSelect = function()
                        TriggerEvent('logic:openCraftingMenu')
                    end
                }
            }
        })
        targetCreated = true
    end
end

--- Start the animation to the crafting ped
--- @param time number: Time to play the animation
function startAnimationToCraftingPed(time)
    if Config.Crafting.Animation.Enabled and DoesEntityExist(cachePed) then
        ClearPedTasks(cachePed)

        lib.requestAnimDict(Config.Crafting.Animation.Dictionary)
        TaskPlayAnim(cachePed, Config.Crafting.Animation.Dictionary, Config.Crafting.Animation.Name, 8.0, -8.0, -1, 49, 0, false, false, false)

        Wait(time)
        ClearPedTasks(cachePed)

        lib.requestAnimDict("mp_common")
        TaskPlayAnim(cachePed, "mp_common", "givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)

        Wait(1000)
        ClearPedTasks(cachePed)
    end
end

local pedPoints = lib.points.new({
    coords = vec3(Config.Ped.Position.x, Config.Ped.Position.y, Config.Ped.Position.z),
    distance = 10,
    pedModel = Config.Ped.Model,
    pedScenario = Config.Ped.Scenario,
    pedCoords = Config.Ped.Position
})

function pedPoints:onEnter()
    Logger('trace', 'You have entered the weapon crafting point')
    
    lib.requestModel(self.pedModel)

    if not DoesEntityExist(cachePed) then
        cachePed = CreatePed(4, self.pedModel, self.pedCoords.x, self.pedCoords.y, self.pedCoords.z, self.pedCoords.w, false, true)
        SetEntityAsMissionEntity(cachePed, true, true)
        SetPedHearingRange(cachePed, 0.0)
        SetPedSeeingRange(cachePed, 0.0)
        SetPedAlertness(cachePed, 0.0)
        SetPedFleeAttributes(cachePed, 0, 0)
        SetBlockingOfNonTemporaryEvents(cachePed, true)
        SetPedCombatAttributes(cachePed, 46, true)
        SetEntityInvincible(cachePed, true)
        FreezeEntityPosition(cachePed, true)
        TaskStartScenarioInPlace(cachePed, self.pedScenario, 0, true)
    end

    SetModelAsNoLongerNeeded(self.pedModel)

    if not Config.BlacklistedJobs[ESX.PlayerData.job.name] then
        createTarget()
    end
end

function pedPoints:onExit()
    Logger('trace', 'You have left the weapon crafting point')
    if DoesEntityExist(cachePed) then
        DeleteEntity(cachePed)
        cachePed = nil
    end
    RemoveAnimDict("mp_common")
    RemoveAnimDict(Config.Crafting.Animation.Dictionary)
    if targetCreated then
        exports.ox_target:removeZone('logic:craftingTarget')
        targetCreated = false
    end
end