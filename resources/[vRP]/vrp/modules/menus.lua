local lang = vRP.lang
local Tools = module("lib/Tools")
local cfg = module("cfg/police")
local cfg_inventory = module("cfg/inventory")


  local choice_handcuff = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.toggleHandcuff(nplayer,{})
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end,lang.police.menu.handcuff.description()}

local choice_putinveh = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.isHandcuffed(nplayer,{}, function(handcuffed)  -- check handcuffed
        if handcuffed then
          vRPclient.putInNearestVehicleAsPassenger(nplayer, {5})
        else
          vRPclient.notify(player,{lang.police.not_handcuffed()})
        end
      end)
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end,lang.police.menu.putinveh.description()}

local choice_getoutveh = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.isHandcuffed(nplayer,{}, function(handcuffed)  -- check handcuffed
        if handcuffed then
          vRPclient.ejectVehicle(nplayer, {})
        else
          vRPclient.notify(player,{lang.police.not_handcuffed()})
        end
      end)
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end,lang.police.menu.getoutveh.description()}

---- askid
local choice_askid = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.notify(player,{lang.police.menu.askid.asked()})
      vRP.request(nplayer,lang.police.menu.askid.request(),15,function(nplayer,ok)
        if ok then
          vRP.getUserIdentity(nuser_id, function(identity)
            if identity then
              -- display identity and business
              local name = identity.name
              local firstname = identity.firstname
              local age = identity.age
              local phone = identity.phone
              local registration = identity.registration
              local bname = ""
              local bcapital = 0
              local home = ""
              local number = ""

              vRP.getUserBusiness(nuser_id, function(business)
                if business then
                  bname = business.name
                  bcapital = business.capital
                end

                vRP.getUserAddress(nuser_id, function(address)
                  if address then
                    home = address.home
                    number = address.number
                  end

                  local content = lang.police.identity.info({name,firstname,age,registration,phone,bname,bcapital,home,number})
                  vRPclient.setDiv(player,{"police_identity",".div_police_identity{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
                  -- request to hide div
                  vRP.request(player, lang.police.menu.askid.request_hide(), 1000, function(player,ok)
                    vRPclient.removeDiv(player,{"police_identity"})
                  end)
                end)
              end)
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
end, lang.police.menu.askid.description()}

---- police check
local choice_check = {function(player,choice)
  vRPclient.getNearestPlayer(player,{5},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.notify(nplayer,{lang.police.menu.check.checked()})
      vRPclient.getWeapons(nplayer,{},function(weapons)
        -- prepare display data (money, items, weapons)
        local money = vRP.getMoney(nuser_id)
        local items = ""
        local data = vRP.getUserDataTable(nuser_id)
        if data and data.inventory then
          for k,v in pairs(data.inventory) do
            local item = vRP.items[k]
            if item then
              items = items.."<br />"..item.name.." ("..v.amount..")"
            end
          end
        end

        local weapons_info = ""
        for k,v in pairs(weapons) do
          weapons_info = weapons_info.."<br />"..k.." ("..v.ammo..")"
        end

        vRPclient.setDiv(player,{"police_check",".div_police_check{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",lang.police.menu.check.info({money,items,weapons_info})})
        -- request to hide div
        vRP.request(player, lang.police.menu.check.request_hide(), 1000, function(player,ok)
          vRPclient.removeDiv(player,{"police_check"})
        end)
      end)
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end, lang.police.menu.check.description()}

local choice_seize_weapons = {function(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player, {5}, function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil and vRP.hasPermission(nuser_id, "police.seizable") then
        vRPclient.isHandcuffed(nplayer,{}, function(handcuffed)  -- check handcuffed
          if handcuffed then
            vRPclient.getWeapons(nplayer,{},function(weapons)
              for k,v in pairs(weapons) do -- display seized weapons
                -- vRPclient.notify(player,{lang.police.menu.seize.seized({k,v.ammo})})
                -- convert weapons to parametric weapon items
                vRP.giveInventoryItem(user_id, "wbody|"..k, 1, true)
                if v.ammo > 0 then
                  vRP.giveInventoryItem(user_id, "wammo|"..k, v.ammo, true)
                end
              end

              -- clear all weapons
              vRPclient.giveWeapons(nplayer,{{},true})
              vRPclient.notify(nplayer,{lang.police.menu.seize.weapons.seized()})
            end)
          else
            vRPclient.notify(player,{lang.police.not_handcuffed()})
          end
        end)
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end, lang.police.menu.seize.weapons.description()}

local choice_seize_items = {function(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player, {5}, function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil and vRP.hasPermission(nuser_id, "police.seizable") then
        vRPclient.isHandcuffed(nplayer,{}, function(handcuffed)  -- check handcuffed
          if handcuffed then
            for k,v in pairs(cfg.seizable_items) do -- transfer seizable items
              local amount = vRP.getInventoryItemAmount(nuser_id,v)
              if amount > 0 then
                local item = vRP.items[v]
                if item then -- do transfer
                  if vRP.tryGetInventoryItem(nuser_id,v,amount,true) then
                    vRP.giveInventoryItem(user_id,v,amount,false)
                    vRPclient.notify(player,{lang.police.menu.seize.seized({item.name,amount})})
                  end
                end
              end
            end

            vRPclient.notify(nplayer,{lang.police.menu.seize.items.seized()})
          else
            vRPclient.notify(player,{lang.police.not_handcuffed()})
          end
        end)
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end, lang.police.menu.seize.items.description()}

-- toggle jail nearest player
local choice_jail = {function(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player, {5}, function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil then
        vRPclient.isJailed(nplayer, {}, function(jailed)
          if jailed then -- unjail
            vRPclient.unjail(nplayer, {})
            vRPclient.notify(nplayer,{lang.police.menu.jail.notify_unjailed()})
            vRPclient.notify(player,{lang.police.menu.jail.unjailed()})
          else -- find the nearest jail
            vRPclient.getPosition(nplayer,{},function(x,y,z)
              local d_min = 1000
              local v_min = nil
              for k,v in pairs(cfg.jails) do
                local dx,dy,dz = x-v[1],y-v[2],z-v[3]
                local dist = math.sqrt(dx*dx+dy*dy+dz*dz)

                if dist <= d_min and dist <= 15 then -- limit the research to 15 meters
                  d_min = dist
                  v_min = v
                end

                -- jail
                if v_min then
                  vRPclient.jail(nplayer,{v_min[1],v_min[2],v_min[3],v_min[4]})
                  vRPclient.notify(nplayer,{lang.police.menu.jail.notify_jailed()})
                  vRPclient.notify(player,{lang.police.menu.jail.jailed()})
                else
                  vRPclient.notify(player,{lang.police.menu.jail.not_found()})
                end
              end
            end)
          end
        end)
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end, lang.police.menu.jail.description()}

local choice_fine = {function(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player, {5}, function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil then
        local money = vRP.getMoney(nuser_id)+vRP.getBankMoney(nuser_id)

        -- build fine menu
        local menu = {name=lang.police.menu.fine.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

        local choose = function(player,choice) -- fine action
          local amount = cfg.fines[choice]
          if amount ~= nil then
            if vRP.tryFullPayment(nuser_id, amount) then
              vRP.insertPoliceRecord(nuser_id, lang.police.menu.fine.record({choice,amount}))
              vRPclient.notify(player,{lang.police.menu.fine.fined({choice,amount})})
              vRPclient.notify(nplayer,{lang.police.menu.fine.notify_fined({choice,amount})})
              vRP.closeMenu(player)
            else
              vRPclient.notify(player,{lang.money.not_enough()})
            end
          end
        end

        for k,v in pairs(cfg.fines) do -- add fines in function of money available
          if v <= money then
            menu[k] = {choose,v}
          end
        end

        -- open menu
        vRP.openMenu(player, menu)
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end, lang.police.menu.fine.description()}

local choice_store_weapons = {function(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Deseja guardar suas armas ? ? Digite sim ou não", "",function(player,resposta)
      if resposta == "sim" then
        vRPclient.getWeapons(player,{},function(weapons)
          for k,v in pairs(weapons) do
            -- convert weapons to parametric weapon items
            vRP.giveInventoryItem(user_id, "wbody|"..k, 1, true)
            if v.ammo > 0 then
              vRP.giveInventoryItem(user_id, "wammo|"..k, v.ammo, true)
            end
          end

          -- clear all weapons
          vRPclient.giveWeapons(player,{{},true})
        end)
      else
        if resposta == "nao" then
          vRPclient.notify(player,{"~r~Você não guardou suas armas."})
        end
      end
    end)
  end
end, lang.police.menu.store_weapons.description()}

-- Remove License (UserID)


local revive_seq = {
  {"amb@medic@standing@kneel@enter","enter",1},
  {"amb@medic@standing@kneel@idle_a","idle_a",1},
  {"amb@medic@standing@kneel@exit","exit",1}
}
  
  local choice_revive = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player,{10},function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil then
        vRPclient.isInComa(nplayer,{}, function(in_coma)
          if in_coma then
            if vRP.tryGetInventoryItem(user_id,"medkit",1,true) then
              vRPclient.playAnim(player,{false,revive_seq,false}) -- anim
              SetTimeout(15000, function()
                vRPclient.varyHealth(nplayer,{40}) 
              end)
            end
          else
            vRPclient.notify(player,{lang.emergency.menu.revive.not_in_coma()})
          end
        end)
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end,lang.emergency.menu.revive.description()}

  local function ch_give(player,choice)
    -- get nearest player
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
      vRPclient.getNearestPlayer(player,{10},function(nplayer)
        if nplayer ~= nil then
          local nuser_id = vRP.getUserId(nplayer)
          if nuser_id ~= nil then
            -- prompt number
            vRP.prompt(player,lang.money.give.prompt(),"",function(player,amount)
              local amount = parseInt(amount)
              if amount > 0 and vRP.tryPayment(user_id,amount) then
                vRP.giveMoney(nuser_id,amount)
                vRPclient.notify(player,{lang.money.given({amount})})
                vRPclient.notify(nplayer,{lang.money.received({amount})})
              else
                vRPclient.notify(player,{lang.money.not_enough()})
              end
            end)
          else
            vRPclient.notify(player,{lang.common.no_player_near()})
          end
        else
          vRPclient.notify(player,{lang.common.no_player_near()})
        end
      end)
    end
  end

-- Opções Menus
-- Policia

-- Opções Unimed

local ch_give_pills = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRPclient.getNearestPlayer(player,{10}, function(nplayer)
      if nplayer ~= nil then
        local nuser_id = vRP.getUserId(nplayer)
        if nuser_id ~= nil then
          vRP.giveInventoryItem(nuser_id, "pills", 1, true)
          vRPclient.notify(player,{"~r~Você deu uma pilula ao cidadão."})
          vRPclient.notify(nplayer,{"~r~Você recebeu uma pilula cidadão."})
        else
          vRPclient.notify(player,{lang.common.no_player_near()})
        end
      else
        vRPclient.notify(player,{lang.common.no_player_near()})
      end
    end)
  end
end, "Dar pilula ao jogador Próximo"}

vRP.registerMenuBuilder("medico", function(add,data)
  local player = data.player
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local choices = {}

    choices["Reviver Jogador Próximo"] = choice_revive
    choices["Dar Pilula"] = ch_give_pills

    add(choices)
  end
end)
-- Opções Pessoais
vRP.registerMenuBuilder("pessoal", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}
    choices[lang.money.give.title()] = {ch_give, lang.money.give.description()}
    choices[lang.police.menu.store_weapons.title()] = choice_store_weapons
    choices[lang.police.menu.check.title()] = choice_check
    add(choices)
  end
end)



RegisterCommand("policia", function(source)
  local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
  if vRP.hasPermission(user_id, "menu.policia") then
      TriggerClientEvent("policia", source)
  else
      vRPclient.notify(player,{"~r~Você não possui permissão."})
  end
end)
vRP.registerMenuBuilder("policia", function(add,data)
  local player = data.player
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local choices = {}
    choices[lang.police.menu.handcuff.title()] = choice_handcuff
    choices[lang.police.menu.putinveh.title()] = choice_putinveh
    choices[lang.police.menu.getoutveh.title()] = choice_getoutveh
    choices[lang.police.menu.check.title()] = choice_check
    choices[lang.police.menu.seize.weapons.title()] = choice_seize_weapons
    choices[lang.police.menu.seize.items.title()] = choice_seize_items
    choices[lang.police.menu.jail.title()] = choice_jail
    choices[lang.police.menu.fine.title()] = choice_fine
    choices[lang.police.menu.askid.title()] = choice_askid
    choices[lang.police.menu.store_weapons.title()] = choice_store_weapons
    add(choices)
  end
end)

vRP.registerMenuBuilder("fac", function(add,data)
  local player = data.player
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local choices = {}

    choices["Algemar"] = choice_handcuff
    choices["Colocar no veículo"] = choice_putinveh
    choices["Tirar do veículo"] = choice_getoutveh
    choices[lang.police.menu.store_weapons.title()] = choice_store_weapons
    choices[lang.police.menu.check.title()] = choice_check

    add(choices)
  end
end)

RegisterCommand("unimed", function(source)
  local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
  if vRP.hasPermission(user_id, "menu.unimed") then
      TriggerClientEvent("unimed", source)
  else
      vRPclient.notify(player,{"~r~Você não possui permissão."})
  end
end)
RegisterCommand("revive", function(source)
  local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
  if vRP.hasPermission(user_id, "god.mode") then
    TriggerClientEvent("vida", source)
    vRP.setHunger(user_id,0)
    vRP.setThirst(user_id,0)
  else
    vRPclient.notify(player,{"~r~Você não possui permissão."})
  end
end)

RegisterCommand("fix", function(source)
  local user_id = vRP.getUserId(source)
  local player = vRP.getUserSource(user_id)
  if vRP.hasPermission(user_id, "admin.fix") then
    TriggerClientEvent("fix", source)
  else
    vRPclient.notify(player,{"~r~Você não possui permissão."})
  end
end)