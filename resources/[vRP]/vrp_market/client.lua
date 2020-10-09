
local displayMercadosBlips = true
local menuEnabled = false

RegisterNetEvent("ToggleActionmenu")
AddEventHandler("ToggleActionmenu", function()
	ToggleActionMenu()
end)

function killTutorialMenu()
SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
		menuEnabled = false

end


local mercados = {
  {name = "Mercado 24 Horas", id=52, x=-47.522762298584, y=-1756.85717773438, z=29.4210109710693},
  {name = "Mercado 24 Horas", id=52, x=-786.59899902344, y=576.21075439453, z=126.73470306396},
  {name = "Mercado 24 Horas", id=52, x=25.7454013824463, y=-1345.26232910156, z=29.4970207214355}, 
  {name = "Mercado 24 Horas", id=52, x=1135.57678222656, y=-981.78125, z=46.4157981872559}, 
  {name = "Mercado 24 Horas", id=52, x=1163.53820800781, y=-323.541320800781, z=69.2050552368164}, 
  {name = "Mercado 24 Horas", id=52, x=374.190032958984, y=327.506713867188, z=103.566368103027}, 
  {name = "Mercado 24 Horas", id=52, x=2555.35766601563, y=382.16845703125, z=108.622947692871}, 
  {name = "Mercado 24 Horas", id=52, x=2676.76733398438, y=3281.57788085938, z=55.2411231994629}, 
  {name = "Mercado 24 Horas", id=52, x=1960.50793457031, y=3741.84008789063, z=32.3437385559082},
  {name = "Mercado 24 Horas", id=52, x=1393.23828125, y=3605.171875, z=34.9809303283691},
  {name = "Mercado 24 Horas", id=52, x=475.42965698242, y=-1688.7590332031, z=29.381744384766},
  {name = "Mercado 24 Horas", id=52, x=1166.18151855469, y=2709.35327148438, z=38.15771484375}, 
  {name = "Mercado 24 Horas", id=52, x=547.987609863281, y=2669.7568359375, z=42.1565132141113}, 
  {name = "Mercado 24 Horas", id=52, x=1698.30737304688, y=4924.37939453125, z=42.0636749267578}, 
  {name = "Mercado 24 Horas", id=52, x=1729.54443359375, y=6415.76513671875, z=35.0372200012207}, 
  {name = "Mercado 24 Horas", id=52, x=-3243.9013671875, y=1001.40405273438, z=12.8307056427002},
  {name = "Mercado 24 Horas", id=52, x=-2967.8818359375, y=390.78662109375, z=15.0433149337769}, 
  {name = "Mercado 24 Horas", id=52, x=436.53967285156, y=-986.67895507813, z=30.689598083496},
  {name = "Mercado 24 Horas", id=52, x=-3041.17456054688, y=585.166198730469, z=7.90893363952637}, 
  {name = "Mercado 24 Horas", id=52, x=-1820.55725097656, y=792.770568847656, z=138.113250732422}, 
  {name = "Mercado 24 Horas", id=52, x=-1486.76574707031, y=-379.553985595703, z=40.163387298584}, 
  {name = "Mercado 24 Horas", id=52, x=-1223.18127441406, y=-907.385681152344, z=12.3263463973999},
  {name = "Mercado 24 Horas", id=52, x=3562.2514648438, y=4535.6997070313, z=46.389503479004},
  {name = "Mercado 24 Horas", id=52, x=3708.900390625, y=4511.5815429688, z=21.68861579895},
  {name = "Mercado 24 Horas", id=52, x= 911.79895019531, y=1777.2360839844, z=162.04559326172},
  {name = "Mercado 24 Horas", id=52, x=826.41644287109, y=1778.0085449219, z=149.42056274414},
  {name = "Mercado 24 Horas", id=52, x=786.47821044922, y=1806.9207763672, z=133.5209197998},
  {name = "Mercado 24 Horas", id=52, x=-617.81652832031, y=-1622.8309326172, z=33.010536193848},
  {name = "Mercado 24 Horas", id=52, x= -868.2509765625, y=-1453.2205810547, z=7.5267992019653},
}


Citizen.CreateThread(function ()
	while true do
      Citizen.Wait(1)
		  if IsNearMarket() then
			DisplayHelpText("Pressione ~g~E~s~ para acessar o Mercado")
		   if (IsControlJustReleased(1, 51)) then
			 SetNuiFocus( true, true )
			  SendNUIMessage({
				  showPlayerMenu = true
			  });
		   end
        end
    end
end)

function IsNearMarket()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(mercados) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 3) then
      return true
    end
  end
end



Citizen.CreateThread(function()
  if displayMercadosBlips then
    for k,v in ipairs(mercados)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)



RegisterNUICallback('leite', function(data, cb)
	TriggerServerEvent("compra","leite", 3)
  	cb('ok')
end)

RegisterNUICallback('agua', function(data, cb)
    TriggerServerEvent("compra","agua", 2)
  	cb('ok')
end)

RegisterNUICallback('vinho', function(data, cb)
TriggerServerEvent("compra","vinho", 8)
  	cb('ok')
end)

RegisterNUICallback('suco', function(data, cb)
TriggerServerEvent("compra","sucodelaranja", 8)
  	cb('ok')
end)

RegisterNUICallback('limonada', function(data, cb)
TriggerServerEvent("compra","limonada", 14)
  	cb('ok')
end)

RegisterNUICallback('vodka', function(data, cb)
TriggerServerEvent("compra","vodka", 30)
  	cb('ok')
end)

RegisterNUICallback('pao', function(data,cb)
TriggerServerEvent("compra","pao", 2)
	cb('ok')
end)

RegisterNUICallback('pipoca', function(data,cb)
TriggerServerEvent("compra","pipoca", 2)
	cb('ok')
end)

RegisterNUICallback('espaguete', function(data,cb)
TriggerServerEvent("compra","espaguete", 8)
	cb('ok')
end)

RegisterNUICallback('pizza', function(data,cb)
TriggerServerEvent("compra","pizza", 65)
	cb('ok')
end)

RegisterNUICallback('rosquinha', function(data,cb)
TriggerServerEvent("compra","rosquinha", 4)
	cb('ok')
end)

RegisterNUICallback('gps', function(data, cb)
	TriggerServerEvent("compra","gps", 300)
  	cb('ok')
end)

RegisterNUICallback('closeButton', function(data, cb)
	killTutorialMenu()
  	cb('ok')
end)




function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
    
-- EVENTOS
RegisterNetEvent('sem:inventario')
AddEventHandler('sem:inventario', function()
    subtitle("~r~Sua Mochila Está Lotada ! ", 30000)
    notificar("~r~Inventário Lotado !")
end)

RegisterNetEvent('sem:dinheiro')
AddEventHandler('sem:dinheiro', function()
    notificar("~r~Sem dinheiro !")
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