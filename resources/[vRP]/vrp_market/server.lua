local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPjb = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
Tunnel.bindInterface("vrp_market",vRPjb)

RegisterServerEvent("compra")
AddEventHandler('compra', function(comida,preco)
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    local weight = vRP.getInventoryWeight({user_id})
    if vRP.tryPayment({user_id, preco}) then
        if weight >= vRP.getInventoryMaxWeight({user_id}) then
            TriggerClientEvent('sem:inventario', player)
        else
            local user_id = vRP.getUserId({player}) 
            vRP.giveInventoryItem({user_id,comida,1,true})
        end
    else
        TriggerClientEvent('sem:dinheiro', player)
    end
end)