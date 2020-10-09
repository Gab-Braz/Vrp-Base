
local cfg = {}

cfg.inventory_weight_per_strength = 10 -- weight for an user inventory per strength level (no unit, but thinking in "kg" is a good norm)

-- default chest weight for vehicle trunks
cfg.default_vehicle_chest_weight = 40

-- define vehicle chest weight by model in lower case
cfg.vehicle_chest_weights = {
    ["kamaztrucker"] = 300,
    ["mantrucker"] = 400,	
    ["mercedestrucker"] = 450,
    ["daftruck"] = 400,	
    ["scaniatrucker"] = 350,
    ["volvotrucker"] = 300
}

cfg.static_personal_chest_types = {
    ["baupublico"] = { -- example of a static chest
      id = "baupublico",
      title = "Baú Público",
      blipid = 50,
      blipcolor = 6,
      weight = 100
    },
}
  
  -- list of static chest points
  cfg.static_personal_chests = {
    {"baupublico", 170.82627868652,-994.48840332031,30.091087341309},
  }

return cfg