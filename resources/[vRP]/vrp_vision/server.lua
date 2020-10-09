local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterCommand("visao",function(source)
	    local source = source
	    local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
		if (vRP.getInventoryItemAmount({user_id, "vision"}) >=1) then
		CancelEvent()
		TriggerClientEvent("anim", source)
		Wait(1500)
        TriggerClientEvent("toogle", source)
		else
		TriggerClientEvent("notificar", source)
		end
end)

local vestirCapacete = {
  	{"veh@helicopter@common","put_on_helmet",1},
}

local tirarOculos = {
	{"missheist_agency2ahelmet","take_off_helmet_stand",1},
}

RegisterServerEvent('colocarOculosAnim')
AddEventHandler('colocarOculosAnim', function()
	vRPclient.playAnim(source,{true,vestirCapacete,false})
end)

RegisterServerEvent('tirarOculosAnim')
AddEventHandler('tirarOculosAnim', function()
	vRPclient.playAnim(source,{true,tirarOculos,false})
end)