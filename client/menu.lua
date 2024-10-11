menuRegistered = false
options = {}

function registerMenu()
    lib.registerContext({
        id = 'logic:craftingMenu',
        title = Config.Strings.TitleMenu,
        options = options
    })

    menuRegistered = true
end