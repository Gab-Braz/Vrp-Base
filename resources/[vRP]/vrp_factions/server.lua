local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_factions")

factions = {
	-- {Grup, Lider Grup, Nume Grup}	
	{"Mecânica", "Mecânico Líder", "Mecânico"},
}

local function ch_inviteInFaction(player,choice)
	local user_id = vRP.getUserId({player})
	for i, v in pairs(factions) do
		group = v[1]
		if(vRP.hasGroup({user_id, group}))then
			groupLider = v[2]
			groupName = v[3]
			theGroup = tostring(group)
			vRP.prompt({player,"ID: ","",function(player,id)
				id = parseInt(id)
				groupName = tostring(groupName)
				local target = vRP.getUserSource({id})
				if(target)then
					if(vRP.hasGroup({id, theGroup}))then
						vRPclient.notify(player,{"~r~Esta pessoa faz parte do grupo ~g~"..groupName.."!"})
					else
						vRP.addUserGroup({id,theGroup})
						local name = GetPlayerName(target)
						vRPclient.notify(player,{"~w~Você incluiu ~g~"..name.."~w~ no grupo ~g~"..groupName.."!"})
						vRPclient.notify(target,{"~w~Você foi incluido ao grupo ~g~"..groupName.."!"})
					end
				else
					vRPclient.notify(player,{"~r~Pessoa não encontrada!"})
				end
			end})
		end
	end
end

local function ch_removeFromFaction(player,choice)
	local user_id = vRP.getUserId({player})
	for i, v in pairs(factions) do
		group = v[1]
		if(vRP.hasGroup({user_id, group}))then
			groupLider = v[2]
			groupName = v[3]
			theGroup = tostring(group)
			vRP.prompt({player,"User id: ","",function(player,id)
				groupName = tostring(groupName)
				id = parseInt(id)
				local target = vRP.getUserSource({id})
				if(target)then
					if(vRP.hasGroup({id, theGroup}))then
						vRP.removeUserGroup({id,theGroup})
						local name = GetPlayerName(target)
						vRPclient.notify(player,{"~w~Você removeu ~g~"..name.." ~w~do grupo ~g~"..groupName.."!"})
						vRPclient.notify(target,{"~w~Você foi removido do grupo ~g~"..groupName.."!"})
					else
						vRPclient.notify(player,{"~w~A pessoa não está no grupo ~r~"..groupName.."!"})
					end
				else
					vRPclient.notify(player,{"~r~Pessoa não encontrada!"})
				end
			end})
		end
	end
end

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		for i, v in pairs(factions) do
			groupLider = v[2]
			if(vRP.hasGroup({user_id, groupLider}))then
				group = v[1]
				groupName = v[3]
				choices["Menu do Líder"] = {function(player,choice)
					vRP.buildMenu({"Menu do Líder", {player = player}, function(menu)
						menu.name = "Menu do Líder"
						menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
						menu.onclose = function(player) vRP.openMainMenu({player}) end
						menu["Adicionar Membro"] = {ch_inviteInFaction, "Incluir pessoa no grupo "..groupName}
						menu["Remover Membro"] = {ch_removeFromFaction, "Remover pessoa do grupo "..groupName}
						vRP.openMenu({player,menu})
					end})
				end, "Menu do Líder do(a) "..groupName}
			end
		end
		add(choices)
	end
end})

local function ch_leaveGroup(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		for i, v in pairs(factions) do
			group = v[1]
			if(vRP.hasGroup({user_id, group}))then
				groupLider = v[2]
				groupName = v[3]
				theGroup = tostring(group)
				vRP.removeUserGroup({user_id,theGroup})
				vRPclient.notify(player,{"~w~Você saiu do grupo~r~"..groupName.."!"})
				vRP.openMainMenu({player})
				local fMembers = vRP.getUsersByGroup({tostring(theGroup)})
				for i, v in ipairs(fMembers) do
					local member = vRP.getUserSource({tonumber(v)})
					vRPclient.notify(member,{"~r~"..GetPlayerName(player).." ~w~Saiu do seu grupo!"})
				end
			end
		end
	end
end

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		for i, v in pairs(factions) do
			group = v[1]
			if(vRP.hasGroup({user_id, group}))then
				groupLider = v[2]
				groupName = v[3]
				choices["Sair do grupo"] = {function(player,choice)
					vRP.buildMenu({"Sair do grupo?", {player = player}, function(menu)
						groupName = tostring(groupName)
						menu.name = "Sair do grupo?"
						menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
						menu.onclose = function(player) vRP.openMainMenu({player}) end

						menu["Sim"] = {ch_leaveGroup, "Sair do grupo "..groupName}
						menu["Não"] = {function(player) vRP.openMainMenu({player}) end}
						vRP.openMenu({player,menu})
					end})
				end, "Leave "..groupName}
			end
		end
		add(choices)
	end
end})

RegisterCommand('f', function(source, args, rawCommand)
	if(args[1] == nil)then
		TriggerClientEvent('chatMessage', source, "^3SYNTAX: /"..rawCommand.." [Message]") 
	else
		local user_id = vRP.getUserId({source})
		theGroup = ""
		for i, v in pairs(factions) do
			if vRP.hasGroup({user_id,tostring(v)}) then
				theGroup = tostring(v[1])
				theName = tostring(v[3])
			end
		end
		local fMembers = vRP.getUsersByGroup({tostring(theGroup)})
		for i, v in ipairs(fMembers) do
			local player = vRP.getUserSource({tonumber(v)})
			TriggerClientEvent('chatMessage', player, "^5["..theName.."] ^7| " .. GetPlayerName(source) .. ": " ..  rawCommand:sub(3))
		end
	end
end)
