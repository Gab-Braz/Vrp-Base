local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_strip", "amorim_core")


-------------------- ZEUS -------------------------
RegisterServerEvent("vrp_strip:paga")
AddEventHandler("vrp_strip:paga", function()
	local source = source
	local user_id = vRP.getUserId({source})
    local preco = math.random(100,600)
  	if vRP.tryPayment({user_id,preco}) then
  		TriggerClientEvent("chatMessage", source, "[Renegado$]", {255, 0, 0}, "Você pagou ^2" .. preco .. " ^7reais pelo show de strip.")
  	else
  		TriggerClientEvent("chatMessage", source, "[Renegado$]", {255, 0, 0}, "Você não possui dinheiro suficiente.")
  	end
end)