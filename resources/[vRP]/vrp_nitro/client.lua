-- Main Thread --
Citizen.CreateThread(function()
    while true do
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and IsControlJustPressed(1, 38) then
            TriggerServerEvent("nitro", source)
        end
        Citizen.Wait(150)
    end
end)

RegisterNetEvent("usenitro")
AddEventHandler("usenitro", function()
    local velocidade = 30.0
    local ped = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(ped, false)	
	SetVehicleBoostActive(playerVeh, 1, 0)
	SetVehicleForwardSpeed(playerVeh, velocidade)
	StartScreenEffect("RaceTurbo", 0, 0)
	SetVehicleBoostActive(playerVeh, 0, 0)
end)
