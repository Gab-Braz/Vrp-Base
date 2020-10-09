function killTutorialMenu()
SetNuiFocus( false, false )
    SendNUIMessage({
      conce = false
    })
end

vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vrp_garages")

local blips = true -- se tiver false não aparecera os blips no mapa

local conce = {
    {name = "Concessionaria de Caminhao", id=524,color=3,x=-43.612354278564,y=-2520.2763671875,z=7.3947081565857}, 
}

Citizen.CreateThread(function()
  while true do
    if isNearConce() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para entrar na Concessionária de Caminhao.")
      if IsControlJustPressed(1, 38) then
        SetNuiFocus(true,true)
        SendNUIMessage({
          conce = true
        })
      end
    end
    Citizen.Wait(3)
  end
end)

function isNearConce()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(conce) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end



Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(conce)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      SetBlipColour(blip, v.color)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

RegisterNUICallback('daftruck', function(data, cb)
  TriggerServerEvent("comprar", "daftruck", 2000000, "car")
  cb('ok')
end)

RegisterNUICallback('kamaztrucker', function(data, cb)
  TriggerServerEvent("comprar", "kamaztrucker", 1400000, "car")
  cb('ok')
end)

RegisterNUICallback('mantrucker', function(data, cb)
  TriggerServerEvent("comprar", "mantrucker", 2000000, "car")
  cb('ok')
end)

RegisterNUICallback('mercedestrucker', function(data, cb)
  TriggerServerEvent("comprar", "mercedestrucker", 2400000, "car")
  cb('ok')
end)

RegisterNUICallback('scaniatrucker', function(data, cb)
  TriggerServerEvent("comprar", "scaniatrucker", 1750000, "car")
  cb('ok')
end)

RegisterNUICallback('volvotrucker', function(data, cb)
  TriggerServerEvent("comprar", "volvotrucker", 1400000, "car")
  cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    killTutorialMenu()
  	cb('ok')
end)

RegisterNetEvent("closee")
AddEventHandler("closee", function()
  SendNUIMessage({
    conce = false
  })
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('sem:inventario')
AddEventHandler('sem:inventario', function()
    notificar("~r~Inventário Lotado !")
end)

function notificar(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end