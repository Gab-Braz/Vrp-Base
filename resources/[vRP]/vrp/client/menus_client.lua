vRP = Proxy.getInterface("vRP")

RegisterNetEvent("policia")
AddEventHandler("policia", function()
  vRPserver.menuPolicia({})
end)

RegisterNetEvent("unimed")
AddEventHandler("unimed", function()
  vRPserver.menuUnimed({})
end)

RegisterNetEvent("pessoal")
AddEventHandler("pessoal", function()
  vRPserver.menuPessoal({})
end)

RegisterNetEvent("vida")
AddEventHandler("vida", function()
  SetEntityHealth(GetPlayerPed(-1), 500)
end)

RegisterNetEvent("fix")
AddEventHandler("fix",function()
  local ped = GetPlayerPed(-1)
  local vehicle = GetVehiclePedIsIn(ped,false)
  if IsPedInAnyVehicle(ped, false) then
    SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
    SetVehicleFixed(vehicle)
    vRP.notify({"~g~Você consertou o seu veículo."})
  else
    vRP.notify({"~r~Você não está em um veículo."})
  end
end)