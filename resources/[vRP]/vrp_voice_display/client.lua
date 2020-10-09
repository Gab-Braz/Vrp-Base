vRPvd = {}
Tunnel.bindInterface("vrp_voice_display",vRPvd)
vRPserver = Tunnel.getInterface("vRP","vrp_voice_display")
VDserver = Tunnel.getInterface("vrp_voice_display","vrp_voice_display")
vRP = Proxy.getInterface("vRP")

local key = 10 -- Tecla usada, caso queira mudar acesse https://wiki.fivem.net/wiki/Controls
local voice = 1

function vRPvd.setTalkerProxity(distance)
	NetworkSetTalkerProximity(distance) -- set range
end

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlJustPressed(1, key) then 
 			voice = voice + 1
			if voice > 3 then voice = 1 end
			VDserver.setVoiceDisplay({false,voice})
 		end
 	end
end)