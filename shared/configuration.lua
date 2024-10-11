local Config <const> = {
    Log = true,

    BlacklistedJobs = { 
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

    Menu = {
        Title = "Construction d'armes", -- Menu Title
        Metadata = {
            TimeForCraft = "Temps de craft",
        }
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
            }
        }
    },

    Farming = {
        Animation = {
            Enabled = true,
            Dictionary = 'anim@heists@box_carry@',
            Name = 'idle'
        },

        Zones = {
            { Id = 'farming:scrapmetal', Position = vec3(2868.8532714844, 2793.927734375, 33.753345489502), Distance = 10, Item = 'scrapmetal', Label = "Récupérer du métal" },
            { Id = 'farming:water', Position = vec3(2868.8532714844, 2793.927734375, 33.753345489502), Distance = 10, Item = 'water', Label = "Récupérer de l'eau" },
        }
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