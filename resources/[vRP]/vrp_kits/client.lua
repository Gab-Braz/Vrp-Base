function killTutorialMenu()
SetNuiFocus( false, false )
    SendNUIMessage({
      unimed = false
    })

    SendNUIMessage({
			repair = false
    })

    SendNUIMessage({
			carteira = false
    })

    SendNUIMessage({
			porte = false
    })
end

local blips = true -- se tiver false não aparecera os blips no mapa

local unimed = {
    {name = "Kit Unimed", id=61,color=1, x=344.1217956543,y=-585.83489990234,z=43.315013885498},
}
local mecanico = {
    {name = "Kit Mecânico", id=402,color=64, x=472.95642089844,y=-1311.7780761719,z=29.220989227295},
}
local cnh = {
  {name = "Comprar CNH", id=408,color=9, x=239.32208251953,y=-1381.1052246094,z=33.741760253906}
}

local porte = {
  {name = "Comprar porte de armas", id=119,color=9, x=447.30969238281,y=-975.54534912109,z=30.689590454102}
}




Citizen.CreateThread(function()
  while true do
   --SetNuiFocus(false)
    if isNearUnimed() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para pegar KIT UNIMED.")
      if IsControlJustPressed(1, 38) then
        SetNuiFocus(true,true)
        SendNUIMessage({
          unimed = true
        })
      end
    end
    if IsNearRepair() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para pegar KIT de Mecânico.")
      if IsControlJustPressed(1, 38) then
        SetNuiFocus(true,true)
        SendNUIMessage({
          repair = true
        })
      end
    end
    if IsNearCnh() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para acessar CNH.")
      if IsControlJustPressed(1,38) then
        SetNuiFocus(true, true)
        SendNUIMessage({
          carteira = true
        })
      end
    end
    if IsNearPorte() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para acessar o porte de armas.")
      if IsControlJustPressed(1,38) then
        SetNuiFocus(true, true)
        SendNUIMessage({
          porte = true
        })
      end
    end


    Citizen.Wait(3)
  end
end)

function isNearUnimed()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(unimed) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end
function IsNearRepair()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(mecanico) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end
function IsNearCnh()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(cnh) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end
function IsNearPorte()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(porte) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end



Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(unimed)do
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

Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(mecanico)do
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

Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(cnh)do
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

Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(porte)do
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



RegisterNUICallback('kit-unimed', function(data, cb)
    TriggerServerEvent("kit:unimed")
  	cb('ok')
end)

RegisterNUICallback('kit-repair', function(data, cb)
    TriggerServerEvent("kit:repair")
  	cb('ok')
end)

RegisterNUICallback('comprar-cnh', function(data, cb)
  TriggerServerEvent("comprar:cnh")
  cb('ok')
end)
RegisterNUICallback('comprar-porte', function(data, cb)
  TriggerServerEvent("comprar:porte")
  cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    killTutorialMenu()
  	cb('ok')
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

    
    --============================================================================================================================================--
       --                                     FUNÇÃO TEXTO LEGENDA                                                                            --
   --============================================================================================================================================
function subtitle(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end