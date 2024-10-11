fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Atoshi'
description 'FiveM Weapon Crafting in a OX Menu'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/configuration.lua'
}

server_scripts {
    'server/*.lua',
    'shared/server_config.lua'
}

client_scripts {
    'client/*.lua'
}

dependencies {
    'ox_lib',
    'ox_target',
    'es_extended'
}
