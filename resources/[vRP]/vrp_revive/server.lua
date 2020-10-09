local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_revive")

function ds(name, message)
	if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
	PerformHttpRequest('https://discordapp.com/api/webhooks/555925423037481000/_R02zJURvPTTKLYFMfQGjRHmzaFCZDx-PAhy2HkmOl_uGAefVuCnj5lEmyLiUGrPMu-e', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

local a_revive = {function(player,choice) 
	vRP.prompt({player,"Player ID:","",function(player,target_id) 
		if target_id ~= nil and target_id ~= "" then 
			local nplayer = vRP.getUserSource({tonumber(target_id)})
			if nplayer ~= nil then
				vRPclient.isInComa(nplayer,{}, function(in_coma)
					if in_coma then
						vRPclient.varyHealth(nplayer,{100}) 
						SetTimeout(150, function()
							vRPclient.varyHealth(nplayer,{100})
							vRP.varyHunger({target_id,-100})
							vRP.varyThirst({target_id,-100})
						end)
						vRPclient.notify(nplayer,{"Você foi revivido pelo administrador ~g~"..GetPlayerName(player)})
						vRPclient.notify(player,{"Voce Foi Revivido ~g~"..GetPlayerName(nplayer)})
					else
						vRPclient.notify(player,{"~r~O Jogador não está em coma!"})
					end
				end)
			end
		else
			vRPclient.notify(player,{"~r~Nenhum ID de jogador selecionado"})
		end 
	end})
end,"Reviver um jogador morto."}

vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
		if vRP.hasPermission({user_id,"admin.revive"}) then
			choices["@Reviver ID"] = a_revive
		end

		add(choices)
	end
end})
