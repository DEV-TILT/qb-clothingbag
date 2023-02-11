fx_version 'cerulean'
game 'gta5'
lua54 'yes'
this_is_a_map 'yes'

version '1.3'

author 'TILT#5099'
github 'https://github.com/DEV-TILT'
discord 'https://discord.gg/NsgmZaTPa7'

shared_scripts {
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}

dependencies {
    'qb-core',
    'qb-target'
}

