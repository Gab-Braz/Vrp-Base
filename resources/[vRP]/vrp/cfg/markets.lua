
local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {
  -- ["food"] = {
  --    _config = {blipid=52, blipcolor=2},

  --   -- list itemid => price
  --   -- Drinks
  --   ["milk"] = 2,
  --   ["water"] = 2,
  --   ["coffee"] = 4,
  --   ["tea"] = 4,
  --   ["icetea"] = 8,
  --   ["orangejuice"] = 8,
  --   ["gocagola"] = 12,
  --   ["redgull"] = 12,
  --   ["lemonlimonad"] = 14,
  --   ["vodka"] = 30,
	-- ["smirnoff"] = 40,

  --   --Food
  --   ["bread"] = 2,
  --   ["donut"] = 2,
	-- ["cocacola"] = 8,
  --   ["tacos"] = 8,
	-- ["pizza"] = 7,
  --   ["sandwich"] = 20,
  --   ["kebab"] = 20,
  --   ["pdonut"] = 65
  -- },


  ["Ferramentas"]= {
    _config = {blipid=478,blipcolor=2},
    ["picareta"] = 100,
    ["vara"] = 100,
    ["rede"] = 100
  },

  ["VIP"] = {
    _config = {blipid=439,blipcolor=2, permissions = {"donater.loadshop"}},
    ["nitro"] = 500,
    ["silenciador"] = 500,
    ["grip"] = 200,
    ["skin"] = 100,
    ["lanterna"] = 150,
  },



}

-- list of markets {type,x,y,z}

cfg.markets = {
  {"Ferramentas",22.365131378174,-1109.9351806641,29.797027587891},
  {"VIP",17.849605560303,-1111.6173095703,29.797027587891}
}

return cfg
