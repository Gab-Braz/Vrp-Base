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


local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  ["mafia"] = {
    _config = {permissions = {"mafia.loadshop"}},
  ["WEAPON_COMBATPISTOL"] = {"Glock",40000,30,""},
  ["WEAPON_ASSAULTRIFLE"] = {"AK-47",250000,50,""},
  ["WEAPON_MICROSMG"] = {"Micro SMG",130000,35,""},
  ["WEAPON_SMG"] = {"SMG",115000,35,""},
  ["WEAPON_PUMPSHOTGUN"] = {"Escopeta",130000,35,""},
  ["WEAPON_KNUCKLE"] = {"Soco ingles",800,50,""},
	["WEAPON_SWITCHBLADE"] = {"Canivete",350,0,""},
  ["ARMOR"] = {"Colete",15000,0,""},
  }, 

  ["motoclube"] = {
    _config = {permissions = {"motoclube.loadshop"}},
    ["WEAPON_COMBATPISTOL"] = {"Glock",40000,30,""},
    ["WEAPON_ASSAULTRIFLE"] = {"AK-47",250000,50,""},
    ["WEAPON_MICROSMG"] = {"Micro SMG",130000,35,""},
    ["WEAPON_SMG"] = {"SMG",115000,35,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Escopeta",130000,35,""},
    ["WEAPON_KNUCKLE"] = {"Soco ingles",800,50,""},
    ["WEAPON_SWITCHBLADE"] = {"Canivete",350,50,""},
    ["ARMOR"] = {"Colete",15000,0,""},
  }, 

  ["yakuza"] = {
    _config = {permissions = {"yakuza.loadshop"}},
    ["WEAPON_COMBATPISTOL"] = {"Glock",40000,30,""},
    ["WEAPON_ASSAULTRIFLE"] = {"AK-47",250000,50,""},
    ["WEAPON_MICROSMG"] = {"Micro SMG",130000,35,""},
    ["WEAPON_SMG"] = {"SMG",115000,35,""},
    ["WEAPON_PUMPSHOTGUN"] = {"Escopeta",130000,35,""},
    ["WEAPON_KNUCKLE"] = {"Soco ingles",800,50,""},
    ["WEAPON_SWITCHBLADE"] = {"Canivete",350,50,""},
    ["ARMOR"] = {"Colete",15000,0,""},
  },  
  ["basic"] = {
    _config = {blipid=110,blipcolor=75},
  ["WEAPON_PISTOL"] = {"Pistola Taurus",30000,30,""},
  ["WEAPON_KNUCKLE"] = {"Soco ingles",800,50,""},
  ["WEAPON_HAMMER"] = {"Martelo",600,50,""},
  ["WEAPON_GOLFCLUB"] = {"Taco de Beisebol",700,50,""},
  ["WEAPON_SWITCHBLADE"] = {"Canivete",350,50,""},
  ["ARMOR"] = {"Colete",15000,0,""},
  },   
  ["basicdonater"] = {
    _config = {permissions = {"donater.loadshop"}},
  ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",40067,30,""},
  ["WEAPON_MICROSMG"] = {"Micro SMG",130000,35,""},
  ["WEAPON_SMG"] = {"SMG",115000,35,""},
  }
}

-- list of gunshops positions

cfg.gunshops = {
  {"basic", 1692.41, 3758.22, 34.7053},
  {"motoclube", -605.25970458984,-1633.6148681641,33.034160614014}, 
  {"yakuza", -899.06243896484,-1445.5875244141,7.5268006324768}, 
  {"mafia", 1486.7905273438,1131.0593261719,114.33668518066}, 
  {"basic", 251.97541809082,-49.83239364624,69.941062927246},
  {"basic", 842.24981689453,-1033.525390625,28.194843292236},
  {"basic", -330.46243286133,6083.814453125,31.454769134521},
  {"basic", -662.03680419922,-935.5654296875,21.829221725464},
  {"basic", -1305.45056152344,-394.0068359375,36.6957740783691},
  {"basic", -1118.0373535156,2698.7280273438,18.554132461548},
  {"basic", 2568.0366210938,294.48431396484,108.73487854004},
  {"basic", -3172.60375976563,1085.74816894531,20.8387603759766},
  {"basic", 19.964742660522,-1106.8742675781,29.797025680542},
  {"basic", 810.15, -2156.88, 29.61},
  {"basicdonater", 811.84332275391,-2156.8413085938,29.618995666504}
}

return cfg
