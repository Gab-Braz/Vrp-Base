local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

AddEventHandler('chatMessage', function(source, name, msg)
    if msg:sub(1,7) == "/forarp" then
        CancelEvent()
        TriggerClientEvent('chatMessage', -1, "[@ForaRP] " .. name, { 34, 209, 25 }, string.sub(msg,9))
    elseif msg:sub(1,4) == "/twt" then
        CancelEvent()
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "[@Twitter] ("..identity.firstname.. " "..identity.name.. ")".. " [" .. user_id .. "]", { 10, 205, 245 }, msg:sub(5))
                end
            end})
        end
    elseif msg:sub(1,4) == "/192" then
    CancelEvent()
    local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "^1[@192] ("..identity.firstname.. " "..identity.name.. ")".. " [" .. user_id .. "]", { 10, 205, 245 }, msg:sub(5))
                end
            end})
        end
    elseif msg:sub(1,4) == "/190" then
    CancelEvent()
    local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "[@190] ("..identity.firstname.. " "..identity.name.. ")".. " [" .. user_id .. "]", { 50, 41, 219 }, msg:sub(5))
                end
            end})
        end
    elseif msg:sub(1,7) == "/ilegal" then
    CancelEvent()
    local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "[@Anonimo] ", { 128,128,128 }, msg:sub(9))
                end
            end})
        end
    elseif msg:sub(1,4) == "/olx" then
    CancelEvent()
    local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "^3[@Olx] ("..identity.firstname.. " "..identity.name.. ")".. " [" .. user_id .. "]",{ 10, 205, 245 }, msg:sub(6))
                end
            end})
        end
        elseif msg:sub(1,4) == "/192" then
    CancelEvent()
    local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "^1[@192] ("..identity.firstname.. " "..identity.name.. ")".. " [" .. user_id .. "]", { 10, 205, 245 }, msg:sub(5))
                end
            end})
        end
    end
end)

         