local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_dvcar")

RegisterCommand("dv",function(source)
	  local user_id = vRP.getUserId({source})
	  local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,"superadmin"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"admin"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"moderador"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"suporte"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Recruta"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Soldado"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Cabo"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] 3º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] 2º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] 1º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Sub-Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
		elseif vRP.hasGroup({user_id,"[PMERJ] 2º Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] 1º Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Capitao"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Major"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Ten. Coronel"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Coronel"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Comandante"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Soldado"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Cabo"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] 3º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] 2º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] 1º Sargento"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Sub-Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] 2º Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] 1º Tenente"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Capitao"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Major"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Ten. Coronel"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Coronel"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[BOPE] Comandante"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Diretor"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Sub-Diretor"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Doutor"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Cirurgiao"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Medico"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Socorrista"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Enfermeiro"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[Unimed] Paramedico"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	  elseif vRP.hasGroup({user_id,"[PMERJ] Estagiario"}) then
		CancelEvent();
		TriggerClientEvent('wk:deleteVehicle', source);
	else
		vRPclient.notify(player, {"~r~Você não tem permissão para deletar veículos !"})
	  end
end)