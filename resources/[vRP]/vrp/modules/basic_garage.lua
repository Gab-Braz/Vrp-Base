-- a basic garage implementation

-- vehicle db
MySQL.createCommand("vRP/vehicles_table", [[
CREATE TABLE IF NOT EXISTS vrp_user_vehicles(
  user_id INTEGER,
  vehicle VARCHAR(255),
  upgrades TEXT,
  CONSTRAINT pk_user_vehicles PRIMARY KEY(user_id,vehicle),
  CONSTRAINT fk_user_vehicles_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);
]])

MySQL.createCommand("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
MySQL.createCommand("vRP/remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/get_vehicles","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id")
MySQL.createCommand("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/get_vehicleups","SELECT upgrades FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND upgrades IS NOT NULL")
MySQL.createCommand("vRP/sell_vehicle_player","UPDATE vrp_user_vehicles SET user_id = @user_id WHERE user_id = @oldUser AND vehicle = @vehicle")

-- init
MySQL.execute("vRP/vehicles_table")

-- load config

local cfg = module("cfg/garages")
local cfg_inventory = module("cfg/inventory")
local vehicle_groups = cfg.garage_types
local lang = vRP.lang

local garages = cfg.garages

-- garage menus

local garage_menus = {}



for group,vehicles in pairs(vehicle_groups) do
  local veh_type = vehicles._config.vtype or "default"
  local gtype = vehicles._config.gtype

  local menu = {
    name=lang.garage.title({group}),
    css={top = "75px", header_color="rgba(255,125,0,0.75)"}
  }
  garage_menus[group] = menu

if gtype == "garagem" or gtype == "policia" then
  menu[lang.garage.owned.title()] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      -- init tmpdata for rents
      local tmpdata = vRP.getUserTmpTable(user_id)
      if tmpdata.rent_vehicles == nil then
        tmpdata.rent_vehicles = {}
      end


      -- build nested menu
      local kitems = {}
      local submenu = {name=lang.garage.title({lang.garage.owned.title()}), css={top="75px",header_color="rgba(255,125,0,0.75)"}}
      submenu.onclose = function()
        vRP.openMenu(player,menu)
      end

      local choose = function(player, choice)
        local vname = kitems[choice]
        if vname then
          -- spawn vehicle
          local vehicle = vehicles[vname]
          if vehicle then
            vRP.closeMenu(player)
            vRPclient.spawnGarageVehicle(player,{veh_type,vname})
          end
        end
      end
      
      -- get player owned vehicles
      MySQL.query("vRP/get_vehicles", {user_id = user_id}, function(pvehicles, affected)
        -- add rents to whitelist
        for k,v in pairs(tmpdata.rent_vehicles) do
          if v then -- check true, prevent future neolua issues
            table.insert(pvehicles,{vehicle = k})
          end
        end

        for k,v in pairs(pvehicles) do
          local vehicle = vehicles[v.vehicle]
          if vehicle then
            submenu[vehicle[1]] = {choose,vehicle[3]}
            kitems[vehicle[1]] = v.vehicle
          end
        end

        vRP.openMenu(player,submenu)
      end)
    end
  end,lang.garage.owned.description()}
end


if gtype == "shop" then
  menu[lang.garage.buy.title()] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then

      -- build nested menu
      local kitems = {}
      local submenu = {name=lang.garage.title({lang.garage.buy.title()}), css={top="75px",header_color="rgba(255,125,0,0.75)"}}
      submenu.onclose = function()
        vRP.openMenu(player,menu)
    end

      local choose = function(player, choice)
        local vname = kitems[choice]
        if vname then
          -- buy vehicle
          local vehicle = vehicles[vname]
          if vehicle and vRP.tryPayment(user_id,vehicle[2]) then
            MySQL.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vname})

            vRPclient.notify(player,{lang.money.paid({vehicle[2]})})
            vRP.closeMenu(player)
          else
            vRPclient.notify(player,{lang.money.not_enough()})
          end
        end
      end
      
      -- get player owned vehicles (indexed by vehicle type name in lower case)
      MySQL.query("vRP/get_vehicles", {user_id = user_id}, function(_pvehicles, affected)
        local pvehicles = {}
        for k,v in pairs(_pvehicles) do
          pvehicles[string.lower(v.vehicle)] = true
        end

        -- for each existing vehicle in the garage group
        for k,v in pairs(vehicles) do
          if k ~= "_config" and pvehicles[string.lower(k)] == nil then -- not already owned
            submenu[v[1]] = {choose,lang.garage.buy.info({v[2],v[3]})}
            kitems[v[1]] = k
          end
        end
        vRP.openMenu(player,submenu)
      end)
    end
end,lang.garage.buy.description()}
end

if gtype == "shop" then
  menu[lang.garage.sell.title()] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then

      -- build nested menu
      local kitems = {}
      local submenu = {name=lang.garage.title({lang.garage.sell.title()}), css={top="75px",header_color="rgba(255,125,0,0.75)"}}
      submenu.onclose = function()
        vRP.openMenu(player,menu)
      end

      local choose = function(player, choice)
        local vname = kitems[choice]
        if vname then
          -- sell vehicle
          local vehicle = vehicles[vname]
          if vehicle then
            local price = math.ceil(vehicle[2]*cfg.sell_factor)

            MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vname}, function(rows, affected)
              if #rows > 0 then -- has vehicle
                vRP.giveMoney(user_id,price)
                MySQL.execute("vRP/remove_vehicle", {user_id = user_id, vehicle = vname})

                vRPclient.notify(player,{lang.money.received({price})})
                vRP.closeMenu(player)
              else
                vRPclient.notify(player,{lang.common.not_found()})
              end
            end)
          end
        end
      end
      
      -- get player owned vehicles (indexed by vehicle type name in lower case)
      MySQL.query("vRP/get_vehicles", {user_id = user_id}, function(_pvehicles, affected)
        local pvehicles = {}
        for k,v in pairs(_pvehicles) do
          pvehicles[string.lower(v.vehicle)] = true
        end

        -- for each existing vehicle in the garage group
        for k,v in pairs(pvehicles) do
          local vehicle = vehicles[k]
          if vehicle then -- not already owned
            local price = math.ceil(vehicle[2]*cfg.sell_factor)
            submenu[vehicle[1]] = {choose,lang.garage.buy.info({price,vehicle[3]})}
            kitems[vehicle[1]] = k
          end
        end

        vRP.openMenu(player,submenu)
      end)
    end
  end,lang.garage.sell.description()}
end

if gtype == "shop" or gtype == "policia" then
  menu[lang.garage.rent.title()] = {function(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      -- init tmpdata for rents
      local tmpdata = vRP.getUserTmpTable(user_id)
      if tmpdata.rent_vehicles == nil then
        tmpdata.rent_vehicles = {}
      end

      -- build nested menu
      local kitems = {}
      local submenu = {name=lang.garage.title({lang.garage.rent.title()}), css={top="75px",header_color="rgba(255,125,0,0.75)"}}
      submenu.onclose = function()
        vRP.openMenu(player,menu)
    end

      local choose = function(player, choice)
        local vname = kitems[choice]
        if vname then
          -- rent vehicle
          local vehicle = vehicles[vname]
          if vehicle then
            local price = math.ceil(vehicle[2]*cfg.rent_factor)
            if vRP.tryPayment(user_id,price) then
              -- add vehicle to rent tmp data
              tmpdata.rent_vehicles[vname] = true

              vRPclient.notify(player,{lang.money.paid({price})})
              vRP.closeMenu(player)
            else
              vRPclient.notify(player,{lang.money.not_enough()})
            end
          end
        end
      end
      
      -- get player owned vehicles (indexed by vehicle type name in lower case)
      MySQL.query("vRP/get_vehicles", {user_id = user_id}, function(_pvehicles, affected)
        local pvehicles = {}
        for k,v in pairs(_pvehicles) do
          pvehicles[string.lower(v.vehicle)] = true
        end

        -- add rents to blacklist
        for k,v in pairs(tmpdata.rent_vehicles) do
          pvehicles[string.lower(k)] = true
        end

        -- for each existing vehicle in the garage group
        for k,v in pairs(vehicles) do
          if k ~= "_config" and pvehicles[string.lower(k)] == nil then -- not already owned
            local price = math.ceil(v[2]*cfg.rent_factor)
            submenu[v[1]] = {choose,lang.garage.buy.info({price,v[3]})}
            kitems[v[1]] = k
          end
        end

        vRP.openMenu(player,submenu)
      end)
    end
  end,lang.garage.rent.description()}
end
  
if gtype == "garagem" or gtype == "policia" then
  menu[lang.garage.store.title()] = {function(player,choice)
    vRPclient.despawnGarageVehicle(player,{veh_type,15})
  end, lang.garage.store.description()}
end
end

local function build_client_garages(source)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    for k,v in pairs(garages) do
      local gtype,x,y,z = table.unpack(v)

      local group = vehicle_groups[gtype]
      if group then
        local gcfg = group._config

        -- enter
        local garage_enter = function(player,area)
          local user_id = vRP.getUserId(source)
          if user_id ~= nil and vRP.hasPermissions(user_id,gcfg.permissions or {}) then
            local menu = garage_menus[gtype]
            if menu then
              vRP.openMenu(player,menu)
            end
          end
        end

        -- leave
        local garage_leave = function(player,area)
          vRP.closeMenu(player)
        end

        vRPclient.addBlip(source,{x,y,z,gcfg.blipid,gcfg.blipcolor,lang.garage.title({gtype})})
        vRPclient.addMarker(source,{x,y,z-1,0.7,0.7,0.5,0,255,125,125,150})
        vRPclient.addTargetMarker(source,{36,x,y,z,1.0,1.0,1.0,0,255,125,125,150})

        vRP.setArea(source,"vRP:garage"..k,x,y,z,1,1.5,garage_enter,garage_leave)
      end
    end
  end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
    build_client_garages(source)
  end
end)

-- VEHICLE MENU

-- define vehicle actions
-- action => {cb(user_id,player,veh_group,veh_name),desc}
local veh_actions = {}

-- open trunk
veh_actions[lang.vehicle.trunk.title()] = {function(user_id,player,vtype,name)
  local chestname = "u"..user_id.."veh_"..string.lower(name)
  local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(name)] or cfg_inventory.default_vehicle_chest_weight

  -- open chest
  vRPclient.vc_openDoor(player, {vtype,5})
  vRP.openChest(player, chestname, max_weight, function()
    vRPclient.vc_closeDoor(player, {vtype,5})
  end)
end, lang.vehicle.trunk.description()}

-- detach trailer
veh_actions[lang.vehicle.detach_trailer.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachTrailer(player, {vtype})
end, lang.vehicle.detach_trailer.description()}

-- detach towtruck
veh_actions[lang.vehicle.detach_towtruck.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachTowTruck(player, {vtype})
end, lang.vehicle.detach_towtruck.description()}

-- detach cargobob
veh_actions[lang.vehicle.detach_cargobob.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachCargobob(player, {vtype})
end, lang.vehicle.detach_cargobob.description()}

-- lock/unlock
veh_actions[lang.vehicle.lock.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_toggleLock(player, {vtype})
end, lang.vehicle.lock.description()}

-- engine on/off
veh_actions[lang.vehicle.engine.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_toggleEngine(player, {vtype})
end, lang.vehicle.engine.description()}

------------------------------------------------------------------------------------------------------
--------------------------------------------- Venda de Veiculo ---------------------------------------
------------------------------------------------------------------------------------------------------

function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/547189840199024641/VPTHkXJHWIhSUWem-3V3YXT-HmpKJOuCAHN3DATC3lG8IYmOTlYd7-QQV_RGkCwp0TiA', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

-- CODE
veh_actions["Vender Veículo"] = {function(playerID,player,vtype,name)
  if playerID ~= nil then
    vRPclient.getNearestPlayers(player,{15},function(nplayers)
        usrList = ""
        for k,v in pairs(nplayers) do
          usrList = usrList .. "[" .. vRP.getUserId(k) .. "]" .. GetPlayerName(k) .. " | "
        end
        if usrList ~= "" then
          vRP.prompt(player,"Pessoas proximas: " .. usrList .. "","",function(player,user_id) 
            user_id = user_id
            if user_id ~= nil and user_id ~= "" then 
              local target = vRP.getUserSource(tonumber(user_id))
              if target ~= nil then
                vRP.prompt(player,"Preço R$: ","",function(player,amount)
                  if (tonumber(amount)) then
                    if (tonumber(amount)) > 0 then
                      MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = name}, function(pvehicle, affected)
                        if #pvehicle > 0 then
                          vRPclient.notify(player,{"Essa pessoa ja possui esse veiculo."})
                        else
                          vRP.request(target,GetPlayerName(player).." quer vender: " ..name.. " no valor de: R$"..amount, 10, function(target,ok)
                            if ok then
                              local pID = vRP.getUserId(target)
                              local money = vRP.getMoney(pID)
                              if (tonumber(money) >= tonumber(amount)) then
                                vRPclient.despawnGarageVehicle(player,{vtype,15}) 
                                vRP.getUserIdentity(pID, function(identity)
                                  MySQL.execute("vRP/sell_vehicle_player", {user_id = user_id, oldUser = playerID, vehicle = name}) 
                                end)
                                vRP.giveMoney(playerID, amount)
                                vRP.setMoney(pID,money-amount)
                                sendToDiscord("VENDA CARRO",user_id .. " envou para o id "..playerID.. " o valor de " ..amount)
                                vRPclient.notify(player,{"Voce vendeu com sucesso o veiculo para ".. GetPlayerName(target).." por R$"..amount.."!"})
                                vRPclient.notify(target,{""..GetPlayerName(player).." vendeu com sucesso o carro por R$"..amount.."!"})
                              else
                                vRPclient.notify(player,{"".. GetPlayerName(target).." não tem dinheiro suficiente!"})
                                vRPclient.notify(target,{"Voce não tem dinheiro suficiente!"})
                              end
                            else
                              vRPclient.notify(player,{""..GetPlayerName(target).." recusou a compra."})
                              vRPclient.notify(target,{"voce recusou a compra de carro do "..GetPlayerName(player).."!"})
                            end
                          end)
                          vRP.closeMenu(player)
                        end 
                      end) 
                    else
                      vRPclient.notify(player,{"O preço precisa ser positivo."})
                    end
                  else
                    vRPclient.notify(player,{"O preço tem que ser numeros."})
                  end
                end)
              else
                vRPclient.notify(player,{"ID invalido."})
              end
            else
              vRPclient.notify(player,{"Nenhum ID Selecionado."})
            end
          end)
        else
          vRPclient.notify(player,{"Não tem ninguem proximo de voce."})
        end
    end)
  end
end, "Vender seu veículo para outro jogador."}

local function ch_vehicle(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    -- check vehicle
    vRPclient.getNearestOwnedVehicle(player,{2},function(ok,vtype,name)
      if ok then
        -- build vehicle menu
        vRP.buildMenu("vehicle", {user_id = user_id, player = player, vtype = vtype, vname = name}, function(menu)
          menu.name=lang.vehicle.title()
          menu.css={top="75px",header_color="rgba(255,125,0,0.75)"}

          for k,v in pairs(veh_actions) do
            menu[k] = {function(player,choice) v[1](user_id,player,vtype,name) end, v[2]}
          end

          vRP.openMenu(player,menu)
        end)
      else
        vRPclient.notify(player,{lang.vehicle.no_owned_near()})
      end
    end)
  end
end



-- ask trunk (open other user car chest)
local function ch_asktrunk(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.notify(player,{lang.vehicle.asktrunk.asked()})
      vRP.request(nplayer,lang.vehicle.asktrunk.request(),15,function(nplayer,ok)
        if ok then -- request accepted, open trunk
          vRPclient.getNearestOwnedVehicle(nplayer,{7},function(ok,vtype,name)
            if ok then
              local chestname = "u"..nuser_id.."veh_"..string.lower(name)
              local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(name)] or cfg_inventory.default_vehicle_chest_weight

              -- open chest
              local cb_out = function(idname,amount)
                vRPclient.notify(nplayer,{lang.inventory.give.given({vRP.getItemName(idname),amount})})
              end

              local cb_in = function(idname,amount)
                vRPclient.notify(nplayer,{lang.inventory.give.received({vRP.getItemName(idname),amount})})
              end

              vRPclient.vc_openDoor(nplayer, {vtype,5})
              vRP.openChest(player, chestname, max_weight, function()
                vRPclient.vc_closeDoor(nplayer, {vtype,5})
              end,cb_in,cb_out)
            else
              vRPclient.notify(player,{lang.vehicle.no_owned_near()})
              vRPclient.notify(nplayer,{lang.vehicle.no_owned_near()})
            end
          end)
        else
          vRPclient.notify(player,{lang.common.request_refused()})
        end
      end)
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end

-- repair nearest vehicle
local function ch_repair(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    -- anim and repair
    if vRP.tryGetInventoryItem(user_id,"repairkit",1,true) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
      SetTimeout(15000, function()
        vRPclient.fixeNearestVehicle(player,{7})
        vRPclient.stopAnim(player,{false})
      end)
    end
  end
end

-- replace nearest vehicle
local function ch_replace(player,choice)
  vRPclient.replaceNearestVehicle(player,{7})
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    -- add vehicle entry
    local choices = {}

    choices[lang.vehicle.title()] = {ch_vehicle}

    choices[lang.vehicle.asktrunk.title()] = {ch_asktrunk}

    add(choices)
  end
end)

vRP.registerMenuBuilder("mecanico", function(add,data)
  local user_id = vRP.getUserId(data.player)
  local player = data.player

  if user_id ~= nil then
    local choices = {}

      choices[lang.vehicle.repair.title()] = {ch_repair, lang.vehicle.repair.description()}

      choices[lang.vehicle.replace.title()] = {ch_replace, lang.vehicle.replace.description()}

    add(choices)
  end
end)

RegisterServerEvent("garage:requestMods")
AddEventHandler("garage:requestMods", function(vname)
  local user_id = vRP.getUserId(source)
  local src = vRP.getUserSource(user_id)
  MySQL.query("vRP/get_vehicleups", {user_id = user_id, vehicle = vname}, function(rows, affected)
    if #rows > 0 then -- has vehicle
      vRPclient.garage_setmods(src, {rows[1].upgrades})
    end
  end)
end)