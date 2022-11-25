fx_version 'adamant'

game 'gta5'

description 'Polisek scripts'

dependencies {	'ox_lib','ox_inventory' }
shared_scripts {    
    '@ox_lib/init.lua',
}

client_scripts {
	'medicbag/client.lua',
}
server_scripts {
	'medicbag/server.lua',
}


lua54 "yes"
