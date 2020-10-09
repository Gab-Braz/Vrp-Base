local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP")
vRPhud = {}
Tunnel.bindInterface("vrp_bars",vRPhud)

function vRPhud.checkHunger()
  local user_id = vRP.getUserId(source)
  return vRP.getHunger(user_id)
end

function vRPhud.checkThirst()
  local user_id = vRP.getUserId(source)
  return vRP.getThirst(user_id)
end


function vRPhud.SetMoney()
  local css = [[
    .div_dinheiro {
      position:absolute;
      top:30%;
      right: 4%;
      font-size: 2em;
      color: white;
    }
  ]]
  local user_id = vRP.getUserId(source)
  vRP.setDiv({"dinheiro",css,vRP.getMoney({user_id})})
end