local Config <const> = {
    Log = true, -- Enable/Disable the log in client and server console
    Debug = true, -- Enable/Disable the red box zone

    BlacklistedJobs = { -- Blacklisted jobs
        ["police"] = true, 
        ["ambulance"] = true
    },
    
    Ped = {
        Model = 'a_m_m_mlcrisis_01', -- Ped Model (https://docs.fivem.net/docs/game-references/ped-models/)
        Position = vec4(2868.8532714844, 2793.927734375, 33.753345489502 - 1, 163.11915588379), -- Ped Position (x, y, z, w) 
        Scenario = 'WORLD_HUMAN_CLIPBOARD_FACILITY' -- Ped Scenario (https://wiki.rage.mp/index.php?title=Scenarios)
    },

    Target = {
        Name = "Discuter avec Ghost",
        DrawSprite = true, -- Enable/Disable Sprite
        Distance = 1.5, -- Distance for taget access
        Icon = 'fa-solid fa-comment' -- Icon (https://fontawesome.com/search?o=r&m=free)
    },

    Strings = {
        TitleMenu = "Construction d'armes",
        TimeForCraft = "Temps de craft",
        Requirements = "Vous n'avez pas assez de %s pour craft cette arme.",
        CheatDetected = "Vous avez été détecté pour cheat."
    },

    Crafting = {
        Animation = {
            Enabled = true, -- Enable/Disable Animation
            Dictionary = 'amb@prop_human_parking_meter@male@base', -- Animation Dictionary (https://wiki.rage.mp/index.php?title=Animations)
            Name = 'base' -- Animation Name (https://wiki.rage.mp/index.php?title=Animations)
        },

        Weapons = {
            ['WEAPON_PISTOL'] = { -- Weapon Name (https://wiki.rage.mp/index.php?title=Weapons)
                Title = "Construction d'une arme de poing", -- Weapon Title
                Image = 'https://docs.altv.mp/gta/images/weapon/models/weapon_pistol_thumbnail.png', -- Weapon Image URL
                TimeForCraft = 5000, -- Crafting Time (in ms)
                Icon = 'fa-solid fa-gun', -- Icon (https://fontawesome.com/search?o=r&m=free)
                IconColor = 'red', -- Icon Color (https://htmlcolorcodes.com/fr/)
                Requirements = { -- Crafting Requirements
                    ['scrapmetal'] = { -- Item Name
                        Label = "Métal", -- Item Label
                        Quantity = 20 -- Item Quantity
                    }, 
                    ['money'] = {
                        Label = "Argent",
                        Quantity = 5000
                    }
                }
            },
            ['WEAPON_ASSAULTRIFLE'] = {
                Title = "Construction d'un fusil d'assaut",
                Image = 'https://www.vespura.com/fivem/weapons/images/WEAPON_ASSAULTRIFLE.png',
                TimeForCraft = 10000,
                Icon = 'fa-solid fa-gun',
                IconColor = 'red',
                Requirements = {
                    ['scrapmetal'] = {
                        Label = "Métal",
                        Quantity = 50
                    },
                    ['money'] = {
                        Label = "Argent",
                        Quantity = 10000
                    }
                }
            },
            ['WEAPON_CARBINERIFLE'] = {
                Title = "Construction d\'une carabine d\'assaut",
                Image = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuG5zL5lwLibbSMApXgu434feY8Fn-Y3qWfQ&s',
                TimeForCraft = 6000,
                Icon = 'fa-solid fa-gun',
                IconColor = 'yellow',
                Requirements = {
                    ['scrapmetal'] = {
                        Label = "Métal",
                        Quantity = 100
                    },
                    ['money'] = {
                        Label = "Argent",
                        Quantity = 2000
                    },
                    ['water'] = {
                        Label = "Eau",
                        Quantity = 4
                    }
                }
            },
            ['weapon_sawnoffshotgun'] = {
                Title = "Construction d\'un fusil à pompe",
                Image = 'https://www.vespura.com/fivem/weapons/images/WEAPON_SAWNOFFSHOTGUN.png',
                TimeForCraft = 10000,
                Icon = 'fa-solid fa-gun',
                IconColor = 'blue',
                Requirements = {
                    ['scrapmetal'] = {
                        Label = "Métal",
                        Quantity = 100
                    },
                    ['money'] = {
                        Label = "Argent",
                        Quantity = 2000
                    },
                    ['water'] = {
                        Label = "Eau",
                        Quantity = 4
                    },
                    ['bread'] = {
                        Label = "Pain",
                        Quantity = 2
                    }
                }
            }
        }
    },

    Farming = {
        Animation = {
            Enabled = true,
            Dictionary = 'random@mugging3', 
            Name = 'pickup_low' 
        },

        Zones = {
            { 
                Position = vec3(2854.7783203125, 2812.9565429688, 33.352336883545), 
                Size = vec3(5, 5, 2), 
                Rotation = 45, 
                Duration = 2000,
                Item = 'scrapmetal', 
                Label = "Récupérer du métal",
                ItemCount = 1,
                TextUI = {
                    position = 'right-center', -- 'right-center' or 'left-center' or 'top-center' or 'bottom-center'
                    icon = 'fa-solid fa-cube',
                    style = {
                        borderRadius = 2,
                        backgroundColor = '#161616',
                        color = 'white'
                    }
                }
            },
            { 
                Position = vec3(2870.9887695312, 2812.748046875, 33.352409362793), 
                Size = vec3(5, 5, 2), 
                Rotation = 45, 
                Duration = 5000,
                Item = 'water', 
                Label = "Récupérer de l'eau",
                ItemCount = 4,
                TextUI = {
                    position = 'right-center',
                    icon = 'fa-solid fa-water',
                    style = {
                        borderRadius = 5,
                        backgroundColor = '#114da4',
                        color = 'white'
                    }
                }
            },

            { 
                Position = vec3(2866.3083496094, 2804.91796875, 33.656467437744), 
                Size = vec3(5, 5, 2), 
                Rotation = 45, 
                Duration = 1000,
                Item = 'bread', 
                Label = "Récupérer du pain",
                ItemCount = 10,
                TextUI = {
                    position = 'left-center',
                    icon = 'fa-solid fa-water',
                    style = {
                        borderRadius = 15,
                        backgroundColor = '#114da4',
                        color = 'red'
                    }
                }
            },
        }
    },

    Webhook = {
        Cheat = 'https://discordapp.com/api/webhooks/1294310191587655720/vOYuW9ji1816sDAWbvZC0XBB4iXasjMKIqgF5wo2_ELsAPDCMYnRu7YZVBJORX0LzRri',
        Farming = 'https://discordapp.com/api/webhooks/1294310293295595562/8ZmSNXblYoW2GiG8YcKaFk0chviAX3IG9oxr0xs32UImC6Lx8Igvs1VmeMh6V3Ds54F5',
        Crafting = 'https://discordapp.com/api/webhooks/1294310243106291733/PYPqGM78PhMJf_hzt8mAMO00WKDn5z2tCYPEoMWpcLD-Zmx5UckGoOTgwT9m9ybAtICj'
    }
}

_ENV.Config = Config

--- Log a message to the client or server console
--- @param type string: success, error, warn, trace, info or ...
--- @param message string: Message to print
function Logger(type, message)
    if not Config.Log then return end

    if type == 'success' then
        print(('[^2SUCCESS^7] %s'):format(message))
    elseif type == 'error' then
        print(('[^1ERROR^7] %s'):format(message))
    elseif type == 'warn' then
        print(('[^3WARNING^7] %s'):format(message))
    elseif type == 'trace' then
        print(('[^4TRACE^7] %s'):format(message))
    else
        print(('[LOGGER] %s'):format(message))
    end
end