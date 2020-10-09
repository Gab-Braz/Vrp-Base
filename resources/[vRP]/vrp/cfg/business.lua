
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 4000000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 24*60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {} 

-- positions of commerce chambers
cfg.commerce_chambers = {
  {-1063.2624511719,-247.63566589355,44.021057128906}
}

return cfg


