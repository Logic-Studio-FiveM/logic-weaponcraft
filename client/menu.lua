menuRegistered = false
options = {}

function registerMenu()
    lib.registerContext({
        id = 'logic:craftingMenu',
        title = Config.Menu.Title,
        options = options
    })

    menuRegistered = true
end