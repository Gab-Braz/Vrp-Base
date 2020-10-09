local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_legacyfuel")

RegisterServerEvent('LegacyFuel:PayFuel')
AddEventHandler('LegacyFuel:PayFuel', function(price)
	local user_id = vRP.getUserId({source})
	local amount  = round(price, 0)

	vRP.tryPayment({user_id,amount})
end)

local Vehicles = {
	{vmodel = 'nil', plate = 'nil', fuel = 100}
}

RegisterServerEvent('LegacyFuel:UpdateServerFuelTable')
AddEventHandler('LegacyFuel:UpdateServerFuelTable', function(vmodel, plate, fuel)
	local found = false

	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].vmodel == vmodel then 
			found = true
			
			if fuel ~= Vehicles[i].fuel then
				table.remove(Vehicles, i)
				table.insert(Vehicles, {vmodel = vmodel, plate = plate, fuel = fuel})
			end
			break 
		end
	end

	if not found then
		table.insert(Vehicles, {vmodel = vmodel, plate = plate, fuel = fuel})
	end
end)

RegisterServerEvent('LegacyFuel:CheckServerFuelTable')
AddEventHandler('LegacyFuel:CheckServerFuelTable', function(plate, vmodel)
	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].vmodel == vmodel then
			local vehInfo = {vmodel = Vehicles[i].vmodel, plate = Vehicles[i].plate, fuel = Vehicles[i].fuel}
			TriggerClientEvent('LegacyFuel:ReturnFuelFromServerTable', source, vehInfo)

			break
		end
	end
end)

RegisterServerEvent('LegacyFuel:CheckCashOnHand')
AddEventHandler('LegacyFuel:CheckCashOnHand', function()
	local user_id = vRP.getUserId({source})
	local cb 	  = vRP.getMoney({user_id})

	TriggerClientEvent('LegacyFuel:RecieveCashOnHand', source, cb)
end)

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

RegisterServerEvent("LegacyFuel:buyCan")
AddEventHandler("LegacyFuel:buyCan", function(price)
	local user_id = vRP.getUserId({source})
	vRPclient.getWeapons(source,{},function(weapons)
		local stringweapons = dump(weapons)
		if string.find(stringweapons, "WEAPON_PETROLCAN") then
			for k,v in pairs(weapons) do
	        	if k == "WEAPON_PETROLCAN" then
	        		if v.ammo >= 0 and v.ammo <= 4050 then
	        			if(vRP.tryPayment({user_id,150})) then
							TriggerClientEvent("LegacyFuel:buyCan", source)
							vRPclient.notify(source,{"~g~Você reabasteceu seu galão."})
						else
							vRPclient.notify(source,{"~r~Dinheiro insuficiente."})
						end
					else
						vRPclient.notify(source,{"~r~Seu galão está já está cheio."})
	        		end
	        	end
	        end
		else
			if(vRP.tryPayment({user_id,price})) then
				TriggerClientEvent("LegacyFuel:buyCan", source)
				vRPclient.notify(source,{"~g~Você comprou seu galão."})
			else
				vRPclient.notify(source,{"~r~Dinheiro insuficiente."})
			end
		end
    end)
end)


function round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
