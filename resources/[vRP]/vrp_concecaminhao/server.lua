local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_concecaminhao")


function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/555925423037481000/_R02zJURvPTTKLYFMfQGjRHmzaFCZDx-PAhy2HkmOl_uGAefVuCnj5lEmyLiUGrPMu-e', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('comprar')
AddEventHandler('comprar', function(vehicle, price)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
		if #pvehicle > 0 then
			vRPclient.notify(player,{"~r~Você já tem esse veículo."})
		else
			if vRP.tryFullPayment({user_id,price}) then
				MySQL.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vehicle})
				vRPclient.notify(player,{"Pago ~r~"..price.."R$."})
				vRPclient.notifyPicture(player, {"CHAR_CARSITE3", 9, "Concessionária", false, "Você comprou seu novo ~r~"..vehicle.."~w~ com Sucesso."})
				sendToDiscord("Concessionária", "ID: "..user_id.." ("..GetPlayerName(player)..") comprou o caminhao "..vehicle.. " e pagou "..price)
			else
				vRPclient.notify(player,{"~r~Você não tem dinheiro suficiente."})
			end
		end
	end)
end)