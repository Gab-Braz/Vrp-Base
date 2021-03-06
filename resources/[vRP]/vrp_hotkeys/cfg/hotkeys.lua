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

-- TUNNEL AND PROXY
cfg = {}
vRPhk = {}
Tunnel.bindInterface("vrp_hotkeys",vRPhk)
vRPserver = Tunnel.getInterface("vRP","vrp_hotkeys")
HKserver = Tunnel.getInterface("vrp_hotkeys","vrp_hotkeys")
vRP = Proxy.getInterface("vRP")

-- GLOBAL VARIABLES
handsup = false
crouched = false
pointing = false
engine = true
called = 0

-- YOU ARE ON A CLIENT SCRIPT ( Just reminding you ;) )
-- Keys IDs can be found at https://wiki.fivem.net/wiki/Controls

-- Hotkeys Configuration: cfg.hotkeys = {[Key] = {group = 1, pressed = function() end, released = function() end},}
cfg.hotkeys = {
  [29] = {
    -- B toggle Point
    group = 0, 
	pressed = function() 
      if not IsPauseMenuActive() and not IsPedInAnyVehicle(GetPlayerPed(-1), true) then  -- Comment to allow use in vehicle
		RequestAnimDict("anim@mp_point")
		while not HasAnimDictLoaded("anim@mp_point") do
          Wait(0)
		end
        pointing = not pointing 
		if pointing then 
		  SetPedCurrentWeaponVisible(GetPlayerPed(-1), 0, 1, 1, 1)
		  SetPedConfigFlag(GetPlayerPed(-1), 36, 1)
		  Citizen.InvokeNative(0x2D537BA194896636, GetPlayerPed(-1), "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
		  RemoveAnimDict("anim@mp_point")
        else
		  Citizen.InvokeNative(0xD01015C7316AE176, GetPlayerPed(-1), "Stop")
		  if not IsPedInjured(GetPlayerPed(-1)) then
		    ClearPedSecondaryTask(GetPlayerPed(-1))
		  end
		  if not IsPedInAnyVehicle(GetPlayerPed(-1), 1) then
		    SetPedCurrentWeaponVisible(GetPlayerPed(-1), 1, 1, 1, 1)
		  end
		  SetPedConfigFlag(GetPlayerPed(-1), 36, 0)
		  ClearPedSecondaryTask(PlayerPedId())
        end 
	  end -- Comment to allow use in vehicle
	end,
	released = function()
	  -- Do nothing on release because it's toggle.
	end,
  },
  [170] = {
    -- L toggle Vehicle Lock
    group = 1, 
	pressed = function() 
	  player = GetPlayerPed(-1)
	  vehicle = GetVehiclePedIsIn(player, false)
	  isPlayerInside = IsPedInAnyVehicle(player, true)
	  lastVehicle = GetPlayersLastVehicle()
	  px, py, pz = table.unpack(GetEntityCoords(player, true))
	  coordA = GetEntityCoords(player, true)

	  for i = 1, 32 do
		coordB = GetOffsetFromEntityInWorldCoords(player, 0.0, (6.281)/i, 0.0)
		local rayHandle = CastRayPointToPoint(coordA.x, coordA.y, coordA.z, coordB.x, coordB.y, coordB.z, 10, GetPlayerPed(-1), 0)
		local a, b, c, d, rayVehicle = GetRaycastResult(rayHandle)
		targetVehicle = rayVehicle
		if targetVehicle ~= nil and targetVehicle ~= 0 then
		  vx, vy, vz = table.unpack(GetEntityCoords(targetVehicle, false))
		  if GetDistanceBetweenCoords(px, py, pz, vx, vy, vz, false) then
			distance = GetDistanceBetweenCoords(px, py, pz, vx, vy, vz, false)
			break
		  end
		end
	  end

	  if distance ~= nil and distance <= 5 and targetVehicle ~= 0 or vehicle ~= 0 then
		if vehicle ~= 0 then
		  plate = GetVehicleNumberPlateText(vehicle)
		else
		  vehicle = targetVehicle
		  plate = GetVehicleNumberPlateText(vehicle)
		end
	    HKserver.canUserLockVehicle({plate, vehicle, isPlayerInside})
	  end
	end,
	released = function()
	  -- Do nothing on release because it's toggle.
	end,
  },
}