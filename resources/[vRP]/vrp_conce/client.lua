function killTutorialMenu()
SetNuiFocus( false, false )
    SendNUIMessage({
      conce = false
    })
end

vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

local blips = true -- se tiver false não aparecera os blips no mapa

local conce = {
    {name = "Concessionária", id=524,color=3,x=-29.763643264771,y=-1104.4368896484,z=26.422355651855},
}

Citizen.CreateThread(function()
  while true do
    if isNearConce() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para entrar na Concessionária.")
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

function Text3D(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*20
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov

  SetTextScale(scaleX*scale, scaleY*scale)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(r, g, b, a)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(2, 0, 0, 0, 150)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(textInput)
  SetDrawOrigin(x,y,z+2, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
end

RegisterNUICallback('f4rr', function(data, cb)
    TriggerServerEvent("comprar2", "f4rr", 200000)
  	cb('ok')
end)
RegisterNUICallback('amv19', function(data, cb)
    TriggerServerEvent("comprar2", "amv19", 1800000, "car")
  	cb('ok')
end)
RegisterNUICallback('ar8lb', function(data, cb)
    TriggerServerEvent("comprar2", "ar8lb", 950000, "car")
  	cb('ok')
end)

RegisterNUICallback('rs6pd600', function(data, cb)
    TriggerServerEvent("comprar2", "rs6pd600", 700000, "car")
  	cb('ok')
end)

RegisterNUICallback('m2f22', function(data, cb)
  TriggerServerEvent("comprar2", "m2f22", 500000, "car")
  cb('ok')
end)

RegisterNUICallback('e92lb', function(data, cb)
  TriggerServerEvent("comprar2", "e92lb", 300000, "car")
  cb('ok')
end)

RegisterNUICallback('17m760i', function(data, cb)
  TriggerServerEvent("comprar2", "17m760i", 200000, "car")
  cb('ok')
end)

RegisterNUICallback('16challenger', function(data, cb)
  TriggerServerEvent("comprar2", "16challenger", 350000, "car")
  cb('ok')
end)

RegisterNUICallback('dm1200', function(data, cb)
  TriggerServerEvent("comprar2", "dm1200", 60000, "bike")
  cb('ok')
end)

RegisterNUICallback('evoque', function(data, cb)
  TriggerServerEvent("comprar2", "evoque", 300000, "car")
  cb('ok')
end)

RegisterNUICallback('ferrariitalia', function(data, cb)
  TriggerServerEvent("comprar2", "ferrariitalia", 2200000, "car")
  cb('ok')
end)

RegisterNUICallback('fiat', function(data, cb)
  TriggerServerEvent("comprar2", "fiat", 18000, "car")
  cb('ok')
end)

RegisterNUICallback('fiattoro', function(data, cb)
  TriggerServerEvent("comprar2", "fiattoro", 350000, "car")
  cb('ok')
end)

RegisterNUICallback('rmodmustang', function(data, cb)
  TriggerServerEvent("comprar2", "rmodmustang", 450000, "car")
  cb('ok')
end)

RegisterNUICallback('fusca', function(data, cb)
  TriggerServerEvent("comprar2", "fusca", 12000, "car")
  cb('ok')
end)

RegisterNUICallback('mk7', function(data, cb)
  TriggerServerEvent("comprar2", "mk7", 180000, "car")
  cb('ok')
end)

RegisterNUICallback('hornet', function(data, cb)
  TriggerServerEvent("comprar2", "hornet", 45000, "bike")
  cb('ok')
end)

RegisterNUICallback('trhawk', function(data, cb)
  TriggerServerEvent("comprar2", "trhawk", 120000, "car")
  cb('ok')
end)

RegisterNUICallback('gtr', function(data, cb)
  TriggerServerEvent("comprar2", "gtr", 700000, "car")
  cb('ok')
end)

RegisterNUICallback('pajero4', function(data, cb)
  TriggerServerEvent("comprar2", "pajero4", 200000, "car")
  cb('ok')
end)

RegisterNUICallback('pturismo', function(data, cb)
  TriggerServerEvent("comprar2", "pturismo", 980000, "car")
  cb('ok')
end)

RegisterNUICallback('punto', function(data, cb)
  TriggerServerEvent("comprar2", "punto", 75000, "car")
  cb('ok')
end)

RegisterNUICallback('r8ppi', function(data, cb)
  TriggerServerEvent("comprar2", "r8ppi", 1200000, "car")
  cb('ok')
end)

RegisterNUICallback('xc40', function(data, cb)
  TriggerServerEvent("comprar2", "xc40", 200000, "car")
  cb('ok')
end)

RegisterNUICallback('350zrb', function(data, cb)
  TriggerServerEvent("comprar2", "350zrb", 450000, "car")
  cb('ok')
end)

RegisterNUICallback('blazerx4', function(data, cb)
  TriggerServerEvent("comprar2", "blazerx4", 120000, "car")
  cb('ok')
end)

RegisterNUICallback('casco', function(data, cb)
  TriggerServerEvent("comprar2", "casco", 12000, "car")
  cb('ok')
end)

RegisterNUICallback('golfgti', function(data, cb)
  TriggerServerEvent("comprar2", "golfgti", 25000, "car")
  cb('ok')
end)

RegisterNUICallback('vwgolf', function(data, cb)
  TriggerServerEvent("comprar2", "vwgolf", 17000, "car")
  cb('ok')
end)

RegisterNUICallback('hondac', function(data, cb)
  TriggerServerEvent("comprar2", "hondac", 30000, "car")
  cb('ok')
end)

RegisterNUICallback('monza', function(data, cb)
  TriggerServerEvent("comprar2", "monza", 12000, "car")
  cb('ok')
end)

RegisterNUICallback('passat', function(data, cb)
  TriggerServerEvent("comprar2", "passat", 40000, "car")
  cb('ok')
end)

RegisterNUICallback('vwpolo', function(data, cb)
  TriggerServerEvent("comprar2", "vwpolo", 17.000, "car")
  cb('ok')
end)

RegisterNUICallback('santafe', function(data, cb)
  TriggerServerEvent("comprar2", "santafe", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('acsr', function(data, cb)
  TriggerServerEvent("comprar2", "acsr", 37, "car")
  cb('ok')
end)

RegisterNUICallback('amarok', function(data, cb)
  TriggerServerEvent("comprar2", "amarok", 150000, "car")
  cb('ok')
end)

RegisterNUICallback('amv19', function(data, cb)
  TriggerServerEvent("comprar2", "amv19", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('A4', function(data, cb)
  TriggerServerEvent("comprar2", "A4", 60000, "car")
  cb('ok')
end)

RegisterNUICallback('rs7', function(data, cb)
  TriggerServerEvent("comprar2", "rs7", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('s5', function(data, cb)
  TriggerServerEvent("comprar2", "s5", 55000, "car")
  cb('ok')
end)

RegisterNUICallback('ttrs', function(data, cb)
  TriggerServerEvent("comprar2", "ttrs", 230000, "car")
  cb('ok')
end)

RegisterNUICallback('barrage2', function(data, cb)
  TriggerServerEvent("comprar2", "barrage2", 350000, "car")
  cb('ok')
end)

RegisterNUICallback('dubsta4x4', function(data, cb)
  TriggerServerEvent("comprar2", "dubsta4x4", 260000, "car")
  cb('ok')
end)
RegisterNUICallback('contgt13', function(data, cb)
  TriggerServerEvent("comprar2", "contgt13", 400000, "car")
  cb('ok')
end)
RegisterNUICallback('bentaygast', function(data, cb)
  TriggerServerEvent("comprar2", "bentaygast", 450000, "car")
  cb('ok')
end)
RegisterNUICallback('G65', function(data, cb)
  TriggerServerEvent("comprar2", "G65", 280000, "car")
  cb('ok')
end)

RegisterNUICallback('m4', function(data, cb)
  TriggerServerEvent("comprar2", "m4", 137000, "car")
  cb('ok')
end)

RegisterNUICallback('rmodbmwi8', function(data, cb)
  TriggerServerEvent("comprar2", "rmodbmwi8", 1000000, "car")
  cb('ok')
end)

RegisterNUICallback('e36drift', function(data, cb)
  TriggerServerEvent("comprar2", "e36drift", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('17m760i', function(data, cb)
  TriggerServerEvent("comprar2", "17m760i", 340000, "car")
  cb('ok')
end)

RegisterNUICallback('x6m', function(data, cb)
  TriggerServerEvent("comprar2", "x6m", 350000, "car")
  cb('ok')
end)

RegisterNUICallback('brabus700', function(data, cb)
  TriggerServerEvent("comprar2", "brabus700", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('chiron', function(data, cb)
  TriggerServerEvent("comprar2", "chiron", 7000000, "car")
  cb('ok')
end)

RegisterNUICallback('bdivo', function(data, cb)
  TriggerServerEvent("comprar2", "bdivo", 7500000, "car")
  cb('ok')
end)

RegisterNUICallback('bug09', function(data, cb)
  TriggerServerEvent("comprar2", "bug09", 6800000, "car")
  cb('ok')
end)

RegisterNUICallback('zl12017', function(data, cb)
  TriggerServerEvent("comprar2", "zl12017", 110000, "car")
  cb('ok')
end)

RegisterNUICallback('cfa44', function(data, cb)
  TriggerServerEvent("comprar2", "cfa44", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('demon', function(data, cb)
  TriggerServerEvent("comprar2", "demon", 180000, "car")
  cb('ok')
end)

RegisterNUICallback('16challenger', function(data, cb)
  TriggerServerEvent("comprar2", "16challenger", 200000, "car")
  cb('ok')
end)

RegisterNUICallback('f22a', function(data, cb)
  TriggerServerEvent("comprar2", "f22a", 37000, "car")
  cb('ok')
end)
--
RegisterNUICallback('ferrariitalia', function(data, cb)
  TriggerServerEvent("comprar2", "ferrariitalia", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('ftoro', function(data, cb)
  TriggerServerEvent("comprar2", "ftoro", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('18f250', function(data, cb)
  TriggerServerEvent("comprar2", "18f250", 350000, "car")
  cb('ok')
end)

RegisterNUICallback('fiestarbcamber', function(data, cb)
  TriggerServerEvent("comprar2", "fiestarbcamber", 30000, "car")
  cb('ok')
end)

RegisterNUICallback('goldwing', function(data, cb)
  TriggerServerEvent("comprar2", "goldwing", 150000, "car")
  cb('ok')
end)

RegisterNUICallback('fpacehm', function(data, cb)
  TriggerServerEvent("comprar2", "fpacehm", 3500000, "car")
  cb('ok')
end)

RegisterNUICallback('srt8', function(data, cb)
  TriggerServerEvent("comprar2", "srt8", 170000, "car")
  cb('ok')
end)

RegisterNUICallback('regera', function(data, cb)
  TriggerServerEvent("comprar2", "regera", 2000000, "car")
  cb('ok')
end)

RegisterNUICallback('lp700r', function(data, cb)
  TriggerServerEvent("comprar2", "lp700r", 1700000, "car")
  cb('ok')
end)

RegisterNUICallback('sesto', function(data, cb)
  TriggerServerEvent("comprar2", "sesto", 2800000, "car")
  cb('ok')
end)

RegisterNUICallback('evo9', function(data, cb)
  TriggerServerEvent("comprar2", "evo9", 135000, "car")
  cb('ok')
end)

RegisterNUICallback('rrs08', function(data, cb)
  TriggerServerEvent("comprar2", "rrs08", 110000, "car")
  cb('ok')
end)

RegisterNUICallback('ghis2', function(data, cb)
  TriggerServerEvent("comprar2", "ghis2", 1200000, "car")
  cb('ok')
end)

RegisterNUICallback('SENNA', function(data, cb)
  TriggerServerEvent("comprar2", "SENNA", 2800000, "car")
  cb('ok')
end)

RegisterNUICallback('p1', function(data, cb)
  TriggerServerEvent("comprar2", "p1", 2000000, "car")
  cb('ok')
end)

RegisterNUICallback('s63amg', function(data, cb)
  TriggerServerEvent("comprar2", "s63amg", 750000, "car")
  cb('ok')
end)

RegisterNUICallback('amggt', function(data, cb)
  TriggerServerEvent("comprar2", "amggt", 1000000, "car")
  cb('ok')
end)

RegisterNUICallback('slsamg', function(data, cb)
  TriggerServerEvent("comprar2", "slsamg", 900000, "car")
  cb('ok')
end)

RegisterNUICallback('c63w205', function(data, cb)
  TriggerServerEvent("comprar2", "c63w205", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('rmodpagani', function(data, cb)
  TriggerServerEvent("comprar2", "rmodpagani", 1900000, "car")
  cb('ok')
end)

RegisterNUICallback('718boxster', function(data, cb)
  TriggerServerEvent("comprar2", "718boxster", 400000, "car")
  cb('ok')
end)

RegisterNUICallback('718caymans', function(data, cb)
  TriggerServerEvent("comprar2", "718caymans", 380000, "car")
  cb('ok')
end)

RegisterNUICallback('palameila', function(data, cb)
  TriggerServerEvent("comprar2", "palameila", 290000, "car")
  cb('ok')
end)

RegisterNUICallback('pcs18', function(data, cb)
  TriggerServerEvent("comprar2", "pcs18", 290000, "car")
  cb('ok')
end)

RegisterNUICallback('macanpd600m', function(data, cb)
  TriggerServerEvent("comprar2", "macanpd600m", 1000000, "car")
  cb('ok')
end)

RegisterNUICallback('rculi', function(data, cb)
  TriggerServerEvent("comprar2", "rculi", 700000, "car")
  cb('ok')
end)

RegisterNUICallback('17highcountry', function(data, cb)
  TriggerServerEvent("comprar2", "17highcountry", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('skyline', function(data, cb)
  TriggerServerEvent("comprar2", "skyline", 240000, "car")
  cb('ok')
end)

RegisterNUICallback('supra2', function(data, cb)
  TriggerServerEvent("comprar2", "supra2", 230000, "car")
  cb('ok')
end)

RegisterNUICallback('cali57', function(data, cb)
  TriggerServerEvent("comprar2", "cali57", 3000000, "car")
  cb('ok')
end)

RegisterNUICallback('lw458s', function(data, cb)
  TriggerServerEvent("comprar2", "lw458s", 1800000, "car")
  cb('ok')
end)

RegisterNUICallback('mux', function(data, cb)
  TriggerServerEvent("comprar2", "mux", 37000, "car")
  cb('ok')
end)

RegisterNUICallback('urus2018', function(data, cb)
  TriggerServerEvent("comprar2", "urus2018", 650000, "car")
  cb('ok')
end)

RegisterNUICallback('lp570', function(data, cb)
  TriggerServerEvent("comprar2", "lp570", 850000, "car")
  cb('ok')
end)

RegisterNUICallback('lamtmc', function(data, cb)
  TriggerServerEvent("comprar2", "lamtmc", 2000000, "car")
  cb('ok')
end)

RegisterNUICallback('vsrx7', function(data, cb)
  TriggerServerEvent("comprar2", "vsrx7", 400000, "car")
  cb('ok')
end)

RegisterNUICallback('fordh', function(data, cb)
  TriggerServerEvent("comprar2", "fordh", 1000000, "car")
  cb('ok')
end)

RegisterNUICallback('ellie6str', function(data, cb)
  TriggerServerEvent("comprar2", "ellie6str", 1000000, "car")
  cb('ok')
end)

RegisterNUICallback('zentenario', function(data, cb)
  TriggerServerEvent("comprar2", "zentenario", 1200000, "car")
  cb('ok')
end)

RegisterNUICallback('xj', function(data, cb)
  TriggerServerEvent("comprar2", "xj", 40000, "bike")
  cb('ok')
end)

RegisterNUICallback('biz25', function(data, cb)
  TriggerServerEvent("comprar2", "biz25", 5000, "bike")
  cb('ok')
end)

RegisterNUICallback('BMWS', function(data, cb)
  TriggerServerEvent("comprar2", "BMWS", 100000, "bike")
  cb('ok')
end)

RegisterNUICallback('bros60', function(data, cb)
  TriggerServerEvent("comprar2", "bros60", 25000, "bike")
  cb('ok')
end)

RegisterNUICallback('cbrr', function(data, cb)
  TriggerServerEvent("comprar2", "cbrr", 100000, "bike")
  cb('ok')
end)

RegisterNUICallback('cgbol', function(data, cb)
  TriggerServerEvent("comprar2", "cgbol", 7000, "bike")
  cb('ok')
end)

RegisterNUICallback('hayabusa', function(data, cb)
  TriggerServerEvent("comprar2", "hayabusa", 1500000, "bike")
  cb('ok')
end)

RegisterNUICallback('r1', function(data, cb)
  TriggerServerEvent("comprar2", "r1", 120000, "bike")
  cb('ok')
end)

RegisterNUICallback('r6', function(data, cb)
  TriggerServerEvent("comprar2", "r6", 180000, "bike")
  cb('ok')
end)

RegisterNUICallback('gsxr', function(data, cb)
  TriggerServerEvent("comprar2", "gsxr", 100000, "bike")
  cb('ok')
end)

RegisterNUICallback('z1000', function(data, cb)
  TriggerServerEvent("comprar2", "z1000", 150000, "bike")
  cb('ok')
end)

RegisterNUICallback('zx10r', function(data, cb)
  TriggerServerEvent("comprar2", "zx10r", 125000, "bike")
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