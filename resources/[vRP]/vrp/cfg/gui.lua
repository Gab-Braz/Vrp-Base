
-- gui config file
local cfg = {}

-- additional css loaded to customize the gui display (see gui/design.css to know the available css elements)
-- it is not recommended to modify the vRP core files outside the cfg/ directory, create a new resource instead
-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
-- example, changing the gui font (suppose a vrp_mod resource containing a custom font)
cfg.css = [[
@font-face {
  font-family: "pcdown";
  src: url(nui://vrp/gui/fonts/pcdown.ttf) format("truetype");
}

@font-face {
  font-family: "bankgothic";
  src: url(nui://vrp/gui/fonts/bankgothic.ttf) format("truetype");
}

body{
  font-family: "Segoe UI";
  font-size: 0.9em;
}
]]

-- list of static menu types (map of name => {.title,.blipid,.blipcolor,.permissions (optional)})
-- static menus are menu with choices defined by vRP.addStaticMenuChoices(name, choices)
cfg.static_menu_types = {
   ["emergency_medkit"] = {
      title = "Emergência", 
      blipcolor = 0,
	  permissions = {
	    "emergency.medkit"
	  }
	}
}

-- list of static menu points
cfg.static_menus = {
  {"emergency_medkit", 434.88391113281,-410.27029418945,47.598628997803},
}


return cfg
