--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

-- MAIN THREAD
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(cfg.hotkeys) do
		  if IsControlJustPressed(v.group, k) or IsDisabledControlJustPressed(v.group, k) then
		    v.pressed()
		  end

		  if IsControlJustReleased(v.group, k) or IsDisabledControlJustReleased(v.group, k) then
		    v.released()
		  end
		end
	end
end)

-- THIS IS FOR POINTING
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if pointing then
      local camPitch = GetGameplayCamRelativePitch()
      if camPitch < -70.0 then
          camPitch = -70.0
      elseif camPitch > 42.0 then
          camPitch = 42.0
      end
      camPitch = (camPitch + 70.0) / 112.0

      local camHeading = GetGameplayCamRelativeHeading()
      local cosCamHeading = Cos(camHeading)
      local sinCamHeading = Sin(camHeading)
      if camHeading < -180.0 then
          camHeading = -180.0
      elseif camHeading > 180.0 then
          camHeading = 180.0
      end
      camHeading = (camHeading + 180.0) / 360.0

      local blocked = 0
      local nn = 0

      local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
      local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, GetPlayerPed(-1), 7);
      nn,blocked,coords,coords = GetRaycastResult(ray)

      Citizen.InvokeNative(0xD5BB4025AE449A4E, GetPlayerPed(-1), "Pitch", camPitch)
      Citizen.InvokeNative(0xD5BB4025AE449A4E, GetPlayerPed(-1), "Heading", camHeading * -1.0 + 1.0)
      Citizen.InvokeNative(0xB0A6CFD2C69C1088, GetPlayerPed(-1), "isBlocked", blocked)
      Citizen.InvokeNative(0xB0A6CFD2C69C1088, GetPlayerPed(-1), "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
    end
  end
end)

-- OTHER FUNCTIONS
function vRPhk.lockVehicle(lockStatus, vehicle)
	if lockStatus == 1 or lockStatus == 0 then -- locked or unlocked

		if IsVehicleEngineOn(vehicle) and not isPlayerInside then
			SetVehicleUndriveable(vehicle, true)
		end

		SetVehicleDoorsLocked(vehicle, 2) 
		SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), true)
		HKserver.lockSystemUpdate({2, plate})

		-- ## Notifications
		    local eCoords = GetEntityCoords(vehicle)
			HKserver.playSoundWithinDistanceOfCoordsForEveryone({eCoords.x, eCoords.y, eCoords.z, 10, "lock", 5.0})   		
			Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle, true, true) -- set as mission entity
			vRP.notifyPicture({"CHAR_PEGASUS_DELIVERY", 3, "vRP", "Porta", "Veículo trancado."})
		-- ## Notifications

	elseif lockStatus == 2 then -- if it is locked

		if not IsVehicleEngineOn(vehicle) then
			Citizen.CreateThread(function()
				while true do
					Wait(0)
					if isPlayerInside then
						SetVehicleUndriveable(vehicle, false)
						break
					end
				end
			end)
		end

		SetVehicleDoorsLocked(vehicle, 1)
		SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), false)
		HKserver.lockSystemUpdate({1, plate})

		-- ## Notifications
		    local eCoords = GetEntityCoords(vehicle)
			HKserver.playSoundWithinDistanceOfCoordsForEveryone({eCoords.x, eCoords.y, eCoords.z, 10, "unlock", 5.0})
			vRP.notifyPicture({"CHAR_PEGASUS_DELIVERY", 3, "vRP", "Porta", "Veículo destrancado."})
		-- ## Notifications

	end
end