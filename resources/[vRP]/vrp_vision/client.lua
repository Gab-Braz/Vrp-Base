vRP = Proxy.getInterface("vRP")

-- local visao = false

-- Citizen.CreateThread(function()
--    while true do
--    Citizen.Wait(0)
--    SetSeethrough(false)
--    end
-- end)



local visao = false

function ToggleActionMenu()
	visao = not visao
	if ( visao ) then
		SetSeethrough(true)
	else
		SetSeethrough(false)
	end
end

RegisterNetEvent("toogle")
AddEventHandler("toogle", function()
ToggleActionMenu()
end)

RegisterNetEvent("notificar")
AddEventHandler("notificar",function()
notification("~r~Você não possui um óculos térmico !")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

RegisterNetEvent("anim")
AddEventHandler("anim", function()
    local player = GetPlayerPed(-1)
    hat = not hat
        if hat then
            if(GetEntityModel(player) == GetHashKey("mp_m_freemode_01")) then
              TriggerServerEvent('colocarOculosAnim')
              Wait(1500)
              SetPedPropIndex(player, 0, 116,0)
            else 
                if(GetEntityModel(player) == GetHashKey("mp_f_freemode_01")) then
                TriggerServerEvent('colocarOculosAnim')
                Wait(1500)
                SetPedPropIndex(player, 0, 116,0)
                end
            end
        else
            if(GetEntityModel(player) == GetHashKey("mp_m_freemode_01")) then
                TriggerServerEvent('tirarOculosAnim')
                Wait(1000)
                SetPedPropIndex(player, 0, 121,0)
            elseif(GetEntityModel(player) == GetHashKey("mp_f_freemode_01")) then
                TriggerServerEvent('tirarOculosAnim')
                Wait(1000)
                SetPedPropIndex(player, 0, 121,0)
            end
        end
end)