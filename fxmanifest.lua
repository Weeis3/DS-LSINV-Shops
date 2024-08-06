fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_script "client.lua"
shared_script "config.lua"

server_script "cord_config.lua"


server_scripts { '@mysql-async/lib/MySQL.lua' }