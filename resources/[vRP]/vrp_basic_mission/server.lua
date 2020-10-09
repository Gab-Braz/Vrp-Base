
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp_basic_mission", "cfg/missions")

-- load global and local languages
local glang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
local lang = Lang.new(module("vrp_basic_mission", "cfg/lang/"..cfg.lang) or {})

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_mission")
Mclient = Tunnel.getInterface("vRP_basic_mission","vRP_basic_mission")

function task_mission()
  -- REPAIR
  for k,v in pairs(cfg.repair) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.repair({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.repair({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"repairkit",1,false}) then
					Mclient.freezePed(player,{true})
					vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
					SetTimeout(15000, function()
					Mclient.freezePed(player,{false})
                    vRP.nextMissionStep({player})
                    vRP.giveInventoryItem({user_id,"repairkit",1,false})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                    end
                  end)
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end







  for k,v in pairs(cfg.carjack) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
	  local reward = math.random(v.min_reward,v.max_reward)
      local user_id = w
      local player = vRP.getUserSource({user_id})
	  	  
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance) == 1 then -- chance check -- chance check
          -- build mission
          local mdata = {}
          mdata.name = v.title
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.carjack().."<br />"..lang.reward({reward}),
              onenter = function(player, area)
			    Mclient.isInAnyVehicle(player,{},function(in_veh)
			      if in_veh then
				   Mclient.getVehiclePedIsInPlateText(player,{}, function(plate)
				    vRP.getUserIdentity({user_id, function(identity)
                      if string.find(plate, identity.registration) then
                        vRPclient.notify(player,{lang.own_veh()})
				      else
                        Mclient.freezePedVehicle(player,{true})
                        SetTimeout(5000, function()
				        vRPclient.deleteVehiclePedIsIn(player,{})
              vRP.giveInventoryItem({user_id,"dirty_money",reward,true})
                        end)
                        vRP.nextMissionStep({player})
					  end
                    end})
				   end)
				  else
				    vRPclient.notify(player,{lang.no_veh()})
				  end
			    end)
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
		end
	  end
    end
  end
  
  SetTimeout(60000,task_mission)
end
task_mission()
