local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

-- this module define some admin menu functions
function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/547189840199024641/VPTHkXJHWIhSUWem-3V3YXT-HmpKJOuCAHN3DATC3lG8IYmOTlYd7-QQV_RGkCwp0TiA', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        vRP.getUserIdentity(k, function(identity)
          if source ~= nil then
            content = content.."<br />"..k.." => <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> <span class=\"endpoint\">"..vRP.getPlayerEndpoint(source).."</span>"
            if identity then
              content = content.." <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> <span class=\"reg\">"..identity.registration.."</span> <span class=\"phone\">"..identity.phone.."</span>"
            end
          end

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
.div_user_list{ 
  margin: auto; 
  padding: 8px; 
  width: 650px; 
  margin-top: 80px; 
  background: black; 
  color: white; 
  font-weight: bold; 
  font-size: 1.1em;
} 

.div_user_list .pseudo{ 
  color: rgb(0,255,125);
}

.div_user_list .endpoint{ 
  color: rgb(255,0,0);
}

.div_user_list .name{ 
  color: #309eff;
}

.div_user_list .reg{ 
  color: rgb(0,125,255);
}
              
.div_user_list .phone{ 
  color: rgb(211, 0, 255);
}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end)
      end
    end
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"Usuario para ser adicionado: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      vRPclient.notify(player,{"Usuario "..id.." adicionado a whitelist"})
      sendToDiscord("ADMIN", "ID - "..user_id.." adicionou ID - "..id.." na whitelist.")
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"Id para ser removido da whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      vRPclient.notify(player,{"Usuario "..id.." removido da whitelist"})
      sendToDiscord("ADMIN", "ID - "..user_id.." removeu ID - "..id.." na whitelist.")
    end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"ID de usuario: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Grupo: ","",function(player,group)
        vRP.addUserGroup(id,group)
        vRPclient.notify(player,{id.." adicionado ao grupo "..group})
        sendToDiscord("ADMIN", "ID - "..user_id.." adicionou ID - "..id.." no grupo "..group)
      end)
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"ID de usuario: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Grupo para ser removido: ","",function(player,group)
        if group ~= nil then
          vRP.removeUserGroup(id,group)
          vRPclient.notify(player,{id.." removido do grupo "..group})
          sendToDiscord("ADMIN", "ID - "..user_id.." removeu ID - "..id.." do grupo "..group)
        else
          vRPclient.notify(player,{"~r~Grupo Inválido."})
        end
      end)
    end)
  end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"ID para ser kickado: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.kick(source,reason)
          vRPclient.notify(player,{"Usuario "..id.." kickado"})
          sendToDiscord("ADMIN", "ID - "..user_id.." kickou o ID - "..id)
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"ID para ser banido: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
          vRPclient.notify(player,{"Usuario "..id.." banido"})
          sendToDiscord("ADMIN", "ID - "..user_id.." baniu o ID - "..id)
        end
      end)
    end)
  end
end

local function ch_spectate(player, choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
		vRP.prompt(player,"User ID: (0 to terminate)","",function(player,pid)
			if pid ~= nil then
				local id = tonumber(pid)
				if id == 0 then
					vRPclient.notify(player, {"Saindo Modo Spectador"})
					vRPclient.stopSpec(player, {})
				elseif id == user_id then
					vRPclient.notify(player, {"ID Spec inválido."})
				else 
					local nplayer = vRP.getUserSource(id)
					if nplayer ~= nil then
						vRPclient.notify(player, {"Modo Spectador ID: " .. id})
						vRPclient.toggleSpec(player, {nplayer})
					end
				end
			end
		end)
	end
end

local function ch_carupgrade(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRPclient.AdminUpgrade(player,{})
  end
end

local function ch_fixclean(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRPclient.FixClean(player,{})
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"ID para ser desbanido: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"Usuario "..id.." desbanido"})
      sendToDiscord("ADMIN", "ID - "..user_id.." desbaniu o ID - "..id)
    end)
  end
end

local function ch_emote(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_emote") then
    vRP.prompt(player,"Animation sequence ('dict anim optional_loops' per line): ","",function(player,content)
      local seq = {}
      for line in string.gmatch(content,"[^\n]+") do
        local args = {}
        for arg in string.gmatch(line,"[^%s]+") do
          table.insert(args,arg)
        end

        table.insert(seq,{args[1] or "", args[2] or "", args[3] or 1})
      end

      vRPclient.playAnim(player,{true,seq,false})
    end)
  end
end

local function ch_sound(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_sound") then
    vRP.prompt(player,"Sound 'dict name': ","",function(player,content)
      local args = {}
      for arg in string.gmatch(content,"[^%s]+") do
        table.insert(args,arg)
      end
      vRPclient.playSound(player,{args[1] or "", args[2] or ""})
    end)
  end
end

local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Copie as coordenadas com Ctrl-A Ctrl-C",x..","..y..","..z,function(player,choice) end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"ID do player:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
        sendToDiscord("ADMIN", "ID - "..player.." puxou o player - "..tplayer.." para a posição dele")
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"ID do player:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
        sendToDiscord("ADMIN", "ID - "..player.." teleportou até o ID - "..tplayer)
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  vRP.prompt(player,"Coords x,y,z:","",function(player,fcoords) 
    local coords = {}
    for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
      table.insert(coords,tonumber(coord))
    end

    local x,y,z = 0,0,0
    if coords[1] ~= nil then x = coords[1] end
    if coords[2] ~= nil then y = coords[2] end
    if coords[3] ~= nil then z = coords[3] end

    vRPclient.teleport(player,{x,y,z})
    sendToDiscord("ADMIN", "ID - "..player.." teleportou até a coordenada "..x,y,z)
  end)
end

local function ch_givemoney(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
        vRP.getUserIdentity(user_id, function(identity)
            if identity then
            local steamname = GetPlayerName(player)
                vRP.prompt(player,"Valor:","",function(player,amount) 
                    vRP.prompt(player,"Qual o motivo:","",function(player,reason) 
                        if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
                            reason = "Sem comentario..."
                        end
                        amount = parseInt(amount)
                        if amount == " " or amount == "" or amount == null or amount == 0 or amount == nil then
                            vRPclient.notify(player,{"Valor invalido."}) 
                        else
                            vRP.giveMoney(user_id, amount)
                            vRPclient.notify(player,{"voce pegou " ..amount.. "RS"})
                            PerformHttpRequest('https://discordapp.com/api/webhooks/547189840199024641/VPTHkXJHWIhSUWem-3V3YXT-HmpKJOuCAHN3DATC3lG8IYmOTlYd7-QQV_RGkCwp0TiA', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "ID: "..user_id.." ("..identity.firstname.." "..identity.name..") pego dinheiro com adm"..amount.." RS - Motivo: "..reason..""}), { ['Content-Type'] = 'application/json' })
                        end
                    end)
                end)
            end
        end)
    end
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.getUserIdentity(user_id, function(identity)
      if identity then
      local steamname = GetPlayerName(player)
        vRP.prompt(player,"ID do Item:","",function(player,idname) 
          idname = idname
            if idname == " " or idname == "" or idname == null or idname == nil then
            vRPclient.notify(player,{"ID invalido."}) 
              else
                vRP.prompt(player,"Numero:","",function(player,amount) 
                    vRP.prompt(player,"Qual o motivo:","",function(player,reason) 
                        if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
                            reason = "Sem comentario..."
                        end
                        if amount == " " or amount == "" or amount == null or amount == nil then
                        vRPclient.notify(player,{"Numero invalido de."}) 
                        else
                            amount = parseInt(amount)
                            vRP.giveInventoryItem(user_id, idname, amount,true)
                            PerformHttpRequest('https://discordapp.com/api/webhooks/547189840199024641/VPTHkXJHWIhSUWem-3V3YXT-HmpKJOuCAHN3DATC3lG8IYmOTlYd7-QQV_RGkCwp0TiA', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "ID: "..user_id.." ("..identity.firstname.." "..identity.name..") pego tanto "..amount.." item. "..idname.." - com adm: "..reason..""}), { ['Content-Type'] = 'application/json' })
                        end
                    end)
                end)
            end
        end)
      end
    end)
  end
end

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Descreva seu problema:","",function(player,desc) 
      desc = desc or ""

      local answered = false
      local players = {}
      for k,v in pairs(vRP.rusers) do
        local player = vRP.getUserSource(tonumber(k))
        -- check user
        if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
          table.insert(players,player)
        end
      end

      -- send notify and alert to all listening players
      for k,v in pairs(players) do
        vRP.request(v,"Ticket para Admin (user_id = "..user_id..") Ir Para O Ticket?: "..htmlEntities.encode(desc), 60, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(player,{"Um admin pegou seu ticket."})
              vRPclient.getPosition(player, {}, function(x,y,z)
                vRPclient.teleport(v,{x,y,z})
              end)
              answered = true
            else
              vRPclient.notify(v,{"Ticker j� foi pego."})
            end
          end
        end)
      end
    end)
  end
end

local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
  vRPclient.toggleNoclip(player, {})
  sendToDiscord("ADMIN", "ID - "..player.." ativou o noclip")
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices["Admin"] = {function(player,choice)
      vRP.buildMenu("admin", {player = player}, function(menu)
        menu.name = "Administração"
        menu.css={}
        menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

        if vRP.hasPermission(user_id,"player.list") then
          menu["@Lista de Usuario"] = {ch_list,"Show/hide user list."}
        end
        if vRP.hasPermission(user_id,"player.whitelist") then
          menu["@Whitelist | Add"] = {ch_whitelist}
        end
        if vRP.hasPermission(user_id,"player.group.add") then
          menu["@Grupo | Add"] = {ch_addgroup}
        end
        if vRP.hasPermission(user_id,"player.group.remove") then
          menu["@Grupo | Remover"] = {ch_removegroup}
        end
        if vRP.hasPermission(user_id,"player.unwhitelist") then
          menu["@Whitelist | Remover"] = {ch_unwhitelist}
        end
        if vRP.hasPermission(user_id,"player.kick") then
          menu["@Player | Kick"] = {ch_kick}
        end
        if vRP.hasPermission(user_id,"player.ban") then
          menu["@Player | Ban"] = {ch_ban}
        end
        if vRP.hasPermission(user_id,"player.unban") then
          menu["@Player | Unban"] = {ch_unban}
        end
        if vRP.hasPermission(user_id,"player.noclip") then
          menu["@Noclip"] = {ch_noclip}
        end
        if vRP.hasPermission(user_id,"player.custom_emote") then
          menu["@Custom emote"] = {ch_emote}
        end
        if vRP.hasPermission(user_id,"player.custom_sound") then
          menu["@Custom sound"] = {ch_sound}
        end
        if vRP.hasPermission(user_id,"player.coords") then
          menu["@Pegar Coordenada"] = {ch_coords}
        end
        if vRP.hasPermission(user_id,"player.tptome") then
          menu["@TpToMe"] = {ch_tptome}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["@TpTo"] = {ch_tpto}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["@TpToCoords"] = {ch_tptocoords}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["@Pegar Dinheiro"] = {ch_givemoney}
        end
        if vRP.hasPermission(user_id,"player.giveitem") then
          menu["@Pegar Item"] = {ch_giveitem}
        end
        if vRP.hasPermission(user_id,"player.display_custom") then
          menu["@Display customization"] = {ch_display_custom}
        end
        if vRP.hasPermission(user_id,"player.calladmin") then
          menu["@Chamar ADM"] = {ch_calladmin}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["@Espectar Jogador"] = {ch_spectate}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["@Tunar Veículo"] = {ch_carupgrade}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["@Fixar veículo"] = {ch_fixclean}
        end
        vRP.openMenu(player,menu)
      end)
    end}
    add(choices)
  end
end)