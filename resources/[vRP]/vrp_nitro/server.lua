local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","vrp_nitro")

RegisterServerEvent("nitro")
AddEventHandler("nitro", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.tryGetInventoryItem({user_id,"nitro",1,false}) then
    vRPclient.notify(player,{"~g~Você usou 1 nitro."})
        TriggerClientEvent("usenitro", source)
    else
        vRPclient.notify(player,{"~r~Você não possui um nitro, compre em algum mercado."})
    end
end)