-- server scripts
server_scripts{ 
  "@vrp/lib/utils.lua",
  "commands-server.lua",
}

-- client scripts
client_scripts{
  "cfg/config.lua",
 }
 
  exports {
    'getSurrenderStatus',
}