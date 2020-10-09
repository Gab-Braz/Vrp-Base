local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","fishing")

RegisterServerEvent('fishing:item')
AddEventHandler('fishing:item', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local cops = vRP.getUsersByGroup({"Pescador"})
	local randomBreak = math.random(1,20)
	if vRP.hasGroup({user_id,"Pescador"}) then
		if not vRP.tryGetInventoryItem({user_id,"vara",1}) then
			TriggerClientEvent('cancel', player)
			vRPclient.notify(player,{"~r~Você precisa de uma vara de pescar, compre na Loja de Ferramentas."})
		else
			TriggerClientEvent('hasFishingPole', player)
			if randomBreak ~= 3 then
				vRP.giveInventoryItem({user_id,"vara",1})
			else
				vRPclient.notify(player,{"~r~Sua vara de pescar está quebrada."})
			end
		end
	else
		vRPclient.notify(player,{"~r~Você não é um pescador!"})
	end
end)

RegisterServerEvent('fishing:reward')
AddEventHandler('fishing:reward', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local randomFish = math.random(1,3)
	if randomFish == 1 then
		vRP.giveInventoryItem({user_id,"bass",1})
	else
		vRP.giveInventoryItem({user_id,"catfish",1})
	end
end)