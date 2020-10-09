local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRPclient = Tunnel.getInterface("vRP", "vrp_kits")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent("kit:unimed")
AddEventHandler('kit:unimed', function()
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    local weight = vRP.getInventoryWeight({user_id})
    if vRP.hasPermission({user_id, "unimed.kit"}) then
        if weight >= vRP.getInventoryMaxWeight({user_id}) then
            TriggerClientEvent('sem:inventario', source)
        else
            local user_id = vRP.getUserId({player}) 
            vRP.giveInventoryItem({user_id,"medkit",20,true})
        end
    else
        vRPclient.notify(player,{"~r~Você não possui permissão para isso."})
    end
end)

RegisterServerEvent("kit:repair")
AddEventHandler('kit:repair', function()
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    local weight = vRP.getInventoryWeight({user_id})
    if vRP.hasPermission({user_id, "mecanico.kit"}) then
        if weight >= vRP.getInventoryMaxWeight({user_id}) then
            TriggerClientEvent('sem:inventario', player)
        else
            local user_id = vRP.getUserId({player}) 
            vRP.giveInventoryItem({user_id,"repairkit",20,true})
        end
    else
        vRPclient.notify(player,{"~r~Você não possui permissão para isso."})
    end
end)

RegisterServerEvent("comprar:cnh")
AddEventHandler("comprar:cnh", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local valor_cnh = 500
    if vRP.hasGroup({user_id, "cnh"}) then
        vRPclient.notify(player,{"~r~Você já possui ~y~CNH"})
    else
        if vRP.tryPayment({user_id, valor_cnh}) then
            vRP.addUserGroup({user_id, "cnh"})
            vRPclient.notify(player,{"~g~Você comprou sua CNH."})
        else
            vRPclient.notify(player,{"~r~Você não possui dinheiro suficiente."})
        end
    end
end)


local ask_cnh = {function(player,choice)
    vRPclient.getNearestPlayer(player,{6}, function(nplayer)
        local nuser_id = vRP.getUserId({nplayer})
        if nuser_id ~= nil then
            vRPclient.notify(player,{"~g~Pedindo permissão para verificar..."})
            vRP.request({nplayer,"Deseja aceitar a permissão para verificar sua CNH ?", 15, function(nplayer,ok)
                if ok then
                    if vRP.hasGroup({nuser_id, "cnh"}) then
                        vRPclient.notify(player,{"~g~Possui CNH."})
                        vRPclient.notify(nplayer,{"~g~O policial verificou e você possui CNH."})
                    else
                        vRPclient.notify(player,{"~r~Não possui CNH."})
                        vRPclient.notify(nplayer,{"~r~O policial verificou e você não possui CNH."})
                    end
                else
                    vRPclient.notify(player,{"~r~O cidadão não lhe deu permissão para verificar."})
                    vRPclient.notify(nplayer,{"~r~Você não deu permissão para o policial verificar."})
                end
            end})
        else
            vRPclient.notify(player,{"~r~Não tem ninguém perto."})
        end
    end)
end, "Verificar CNH da pessoa mais próxima."}

local remove_cnh = {function(player,choice)
    vRPclient.getNearestPlayer(player,{6}, function(nplayer)
        local nuser_id = vRP.getUserId({nplayer})
        if nuser_id ~= nil then
            vRP.request({player,"Você deseja mesmo remover a CNH do ID: "..nuser_id.." ?",15, function(player,ok)
                if ok then
                    vRP.removeUserGroup({nuser_id, "cnh"})
                    vRPclient.notify(player,{"~r~Você removeu a CNH do ID "..nuser_id})
                    vRPclient.notify(nplayer,{"~r~Removeram sua CNH"})
                end
            end})
        else
            vRPclient.notify(player,{"~r~Não tem ninguém perto."})
        end
    end)
end, "Remover CNH da pessoa próxima."}








RegisterServerEvent("comprar:porte")
AddEventHandler("comprar:porte", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local valor_porte = 500
    if vRP.hasGroup({user_id, "porte"}) then
        vRPclient.notify(player,{"~r~Você já possui ~y~Porte de armas"})
    else
        if vRP.tryPayment({user_id, valor_porte}) then
            vRP.addUserGroup({user_id, "porte"})
            vRPclient.notify(player,{"~g~Você comprou seu Porte de armas."})
        else
            vRPclient.notify(player,{"~r~Você não possui dinheiro suficiente."})
        end
    end
end)


local ask_porte = {function(player,choice)
    vRPclient.getNearestPlayer(player,{6}, function(nplayer)
        local nuser_id = vRP.getUserId({nplayer})
        if nuser_id ~= nil then
            vRPclient.notify(player,{"~g~Pedindo permissão para verificar..."})
            vRP.request({nplayer,"Deseja aceitar a permissão para verificar seu porte de armas ?", 15, function(nplayer,ok)
                if ok then
                    if vRP.hasGroup({nuser_id, "porte"}) then
                        vRPclient.notify(player,{"~g~Possui Porte de armas."})
                        vRPclient.notify(nplayer,{"~g~O policial verificou e você possui Porte de armas."})
                    else
                        vRPclient.notify(player,{"~r~Não possui Porte de armas."})
                        vRPclient.notify(nplayer,{"~r~O policial verificou e você não possui Porte de armas."})
                    end
                else
                    vRPclient.notify(player,{"~r~O cidadão não lhe deu permissão para verificar."})
                    vRPclient.notify(nplayer,{"~r~Você não deu permissão para o policial verificar."})
                end
            end})
        else
            vRPclient.notify(player,{"~r~Não tem ninguém perto."})
        end
    end)
end, "Verificar Porte da pessoa mais próxima."}

local remove_porte = {function(player,choice)
    vRPclient.getNearestPlayer(player,{6}, function(nplayer)
        local nuser_id = vRP.getUserId({nplayer})
        if nuser_id ~= nil then
            vRP.request({player,"Você deseja mesmo remover porte de armas do ID: "..nuser_id.." ?",15, function(player,ok)
                if ok then
                    vRP.removeUserGroup({nuser_id, "porte"})
                    vRPclient.notify(player,{"~r~Você removeu o porte do ID "..nuser_id})
                    vRPclient.notify(nplayer,{"~r~Removeram seu porte"})
                end
            end})
        else
            vRPclient.notify(player,{"~r~Não tem ninguém perto."})
        end
    end)
end, "Remover Porte da pessoa próxima."}



vRP.registerMenuBuilder({"policia", function(add,data)
    local player = data.player
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
        local choices = {}

        choices["Pedir CNH"] = ask_cnh
        choices["Remover CNH"] = remove_cnh
        

        choices["Pedir porte de armas"] = ask_porte
        choices["Remover Porte de armas"] = remove_porte

        add(choices)
    end
end})