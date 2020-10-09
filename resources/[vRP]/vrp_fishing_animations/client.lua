----------------
-- E  D  I  T --
----------------

local StartFishing_KEY = 170 -- F3
local Caught_KEY = 201 -- ENTER
local SuccessLimit = 0.07 -- Maxim 0.1 (high value, low success chances)
local AnimationSpeed = 0.0015
local ShowChatMSG = true -- or false
local blips = true -- criar blips area de pesca



----------------
-- C  O  D  E --
----------------

-- V A R S
local IsFishing = false
local CFish = false
local hasPole = false
local BarAnimation = 0
local Faketimer = 0
local RunCodeOnly1Time = true
local PosX = 0.5
local PosY = 0.1
local TimerAnimation = 0.1

RegisterNetEvent('hasFishingPole')
AddEventHandler('hasFishingPole', function()
	hasPole = true
end)

RegisterNetEvent('cancel')
AddEventHandler('cancel', function()
	hasPole = false
	IsFishing = false
end)


function painelNovo_txt(x,y ,width,height,scale, text, r,g,b,a, font)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

local areas = {
	{name="Área de Pesca",id=68,color=2,x=-8.6453075408936,y=716.56597900391,z=198.0082244873},
}


function perto()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for _, item in pairs(areas) do
	  local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
	  if(distance <= 30) then
		return true
	  end
	end
	end
	
	Citizen.CreateThread(function()
		if blips then
			for k,v in ipairs(areas)do
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

-- T H R E A D
Citizen.CreateThread(function()
	while true do Citizen.Wait(1)
		if IsControlJustPressed(1, StartFishing_KEY) then
			if not IsPedInAnyVehicle(GetPed(), false) then
				if not IsPedSwimming(GetPed()) then
					if IsEntityInWater(GetPed()) then
						if perto() then
							TriggerServerEvent('fishing:item')
							if hasPole then 
								IsFishing = true
								if ShowChatMSG then 
									Chat(msg[1]) 
								end
									RunCodeOnly1Time = true
									BarAnimation = 0
								end	
								else
								if ShowChatMSG then 
								end							
							end
						else
							Chat(msg[6]) 
						end
					end
				end
		end

		-- amorim
		if perto() then
			painelNovo_txt(0.84, 1.2 ,1.0,1.0,1.3,"~r~Pressione F3 para pescar ná água.", 255,255,255,250, 1)
		end
		

		while IsFishing do
			local time = 4*3000
			TaskStandStill(GetPed(), time+7000)
			FishRod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
			PlayAnim(GetPed(),'amb@world_human_stand_fishing@base','base',4,3000)
			Citizen.Wait(time)
			CFish = true
			IsFishing = false
		end
		while CFish do
			Citizen.Wait(1)
			FishGUI(true)
			if RunCodeOnly1Time then
				Faketimer = 1
				RunCodeOnly1Time = false
				PlayAnim(GetPed(),'amb@world_human_stand_fishing@idle_a','idle_c',1,0) -- 10sec
			end
			if TimerAnimation <= 0 then
				CFish = false
				TimerAnimation = 0.1
				StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
				Citizen.Wait(200)
				DeleteEntity(FishRod)
				if ShowChatMSG then Chat('^1'..msg[2]) end
				
			end
			if IsControlJustPressed(1, Caught_KEY) then
				if BarAnimation >= SuccessLimit then
					CFish = false
					TimerAnimation = 0.1
					if ShowChatMSG then Chat('^2'..msg[3]) end
	                TriggerServerEvent('fishing:reward')
					StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
					Citizen.Wait(200)
					DeleteEntity(FishRod)
				else
					CFish = false
					TimerAnimation = 0.1
					StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
					Citizen.Wait(200)
					DeleteEntity(FishRod)
					if ShowChatMSG then Chat('^1'..msg[4]) end
				end
			end
		end
	end
end)
Citizen.CreateThread(function() -- Thread for  timer
	while true do 
		Citizen.Wait(500)
		Faketimer = Faketimer + 1
	end 
end)

-- F  U  N  C  T  I  O  N  S 
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end
function GetPed() return GetPlayerPed(-1) end
function text(x,y,scale,text)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(255,255,255,255)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
function FishGUI(bool)
	if not bool then return end
	painelNovo_txt(0.84, 1.2 ,1.0,1.0,1.3,"~r~Pressione Enter para pegar o peixe.", 255,255,255,250, 1)
	DrawRect(PosX,PosY+0.005,TimerAnimation,0.005,255,255,0,255)
	DrawRect(PosX,PosY,0.1,0.01,0,0,0,255)
	TimerAnimation = TimerAnimation - 0.0001025
	if BarAnimation >= SuccessLimit then
		DrawRect(PosX,PosY,BarAnimation,0.01,102,255,102,150)
	else
		DrawRect(PosX,PosY,BarAnimation,0.01,255,51,51,150)
	end
	if BarAnimation <= 0 then
		up = true
	end
	if BarAnimation >= PosY then
		up = false
	end
	if not up then
		BarAnimation = BarAnimation - AnimationSpeed
	else
		BarAnimation = BarAnimation + AnimationSpeed
	end
	text(0.4,0.05,0.35, msg[5])
end
function PlayAnim(ped,base,sub,nr,time) 
	Citizen.CreateThread(function() 
		RequestAnimDict(base) 
		while not HasAnimDictLoaded(base) do 
			Citizen.Wait(1) 
		end
		if IsEntityPlayingAnim(ped, base, sub, 3) then
			ClearPedSecondaryTask(ped) 
		else 
			for i = 1,nr do 
				TaskPlayAnim(ped, base, sub, 8.0, -8, -1, 16, 0, 0, 0, 0) 
				Citizen.Wait(time) 
			end 
		end 
	end) 
end
function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
	BoneID = GetPedBoneIndex(GetPed(), bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(GetPed()))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(GetPed(),2))
	AttachEntityToEntity(obj,  GetPed(),  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end
function Chat(text)
	TriggerEvent("chatMessage", 'Pescar', { 255,255,0}, text)
end




