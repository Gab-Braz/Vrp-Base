
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition 
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0.1 -- 10% of the original price if a rent
cfg.sell_factor = 0.6 -- sell for 75% of the original price

cfg.garage_types = {

  ["Garagem"] = {
    _config = {gtype="garagem", vtype="car", blipid=357,blipcolor=3},
    ["f4rr"] = {"Agusta", 0, ""},
    ["amv19"] = {"Aston Martin", 0, ""},
    ["ar8lb"] = {"Audi R8 Turbo", 0, ""},
    ["rs6pd600"] = {"Audi RS6", 0, ""},
    ["m2f22"] = {"Bmw m2", 0, ""},
    ["e92lb"] = {"Bmw e92", 0, ""},
    ["17m760i"] = {"Bmw 760li", 0, ""},
    ["16challenger"] = {"Dodge Chalanger", 0, ""},
    ["dm1200"] = {"Ducati", 0, ""},
    ["evoque"] = {"Range Rover Evoque", 0, ""},
    ["ferrariitalia"] = {"Ferrari Italia", 0, ""},
    ["fiat"] = {"Fiat 147", 0, ""},
    ["fiattoro"] = {"Fiat Toro", 0, ""},
    ["rmodmustang"] = {"Mustang Drift", 0, ""},
    ["fusca"] = {"Fusca", 0, ""},
    ["mk7"] = {"Golf GTI", 0, ""},
    ["hornet"] = {"Hornet", 0, ""},
    ["trhawk"] = {"Jeep", 0, ""},
    ["gtr"] = {"Nissan GTR", 0, ""},
    ["pajero4"] = {"Pajero", 0, ""},
    ["pturismo"] = {"Porsche Panamera Turbo", 0, ""},
    ["punto"] = {"Fiat Punto", 0,""},
    ["r8ppi"] = {"Audi R8", 0, ""},
    ["xc40"] = {"Volvo XC40", 0, ""},
    ["xj"] = {"XJ6", 0,""},
	["350zrb"] = {"370z", 0,""},
	["blazerx4"] = {"blazerx4", 0,""},
	["casco"] = {"chevette", 0,""},
	["golfgti"] = {"golfgti", 0,""},
	["vwgolf"] = {"vwgolf", 0,""},
	["hondac"] = {"civic", 0,""},
	["monza"] = {"monza", 0,""},
	["vwpolo"] = {"polo", 0,""},
	["passat"] = {"passat", 0,""},
	["santafe"] = {"santafe", 0,""},
	["acsr"] = {"aguera", 0,""},
	["amarok"] = {"Amarok_V6", 0,""},
	["amv19"] = {"astonmartin", 0,""},
	["A4"] = {"Audi_a4", 0,""},
	["rs7"] = {"Audi_rs7", 0,""},
	["s5"] = {"Audi_s5", 0,""},
	["ttrs"] = {"Audi_TT", 0,""},
	["barrage2"] = {"barrage", 0,""},
	["dubsta4x4"] = {"Benefactor", 0,""},
	["contgt13"] = {"Bentley", 0,""},
	["bentaygast"] = {"BentleyBentayga", 0,""},
	["G65"] = {"BenzG65", 0,""},
	["m4"] = {"bmw4", 0,""},
	["rmodbmwi8"] = {"BMWI8", 0,""},
	["e36drift"] = {"bmwm3", 0,""},
	["17m760i"] = {"bmwm760i", 0,""},
	["x6m"] = {"BMWX6MF16", 0,""},
	["brabus700"] = {"BRABUS700G63", 0,""},
	["chiron"] = {"Bugatti_Chiron", 0,""},
	["bdivo"] = {"Bugatti_Divo", 0,""},
	["bug09"] = {"Bugatti_Veyron", 0,""},
	["zl12017"] = {"Camaro", 0,""},
	["cfa44"] = {"CFA-44", 0,""},
	["demon"] = {"challenger", 0,""},
	["16challenger"] = {"challenger2", 0,""},
	["f22a"] = {"F-22", 0,""},
	["ferrariitalia"] = {"ferrariitalia", 0,""},
	["ftoro"] = {"Fiat_toro", 0,""},
	["18f250"] = {"Ford_F-250", 0,""},
	["fiestarbcamber"] = {"Ford_fiesta", 0,""},
	["rmodmustang"] = {"FordMustang", 0,""},
	["goldwing"] = {"goldwing", 0,""},
	["fpacehm"] = {"JaguarFpace", 0,""},
	["srt8"] = {"Jeep_SRT8_2015", 0,""},
	["regera"] = {"KoenigseggRegera", 0,""},
	["raptor2017"] = {"laferrari", 0,""},
	["lp700r"] = {"Lamborghini_Aventador", 0,""},
	["sesto"] = {"Lamborghini_Elementor", 0,""},
	["evo9"] = {"lancer-evolution", 0,""},
	["rrs08"] = {"Lange_Rover_Supercharged", 0,""},
	["ghis2"] = {"maseratii", 0,""},
	["SENNA"] = {"mclaren_senna", 0,""},
	["p1"] = {"mclarenp1", 0,""},
	["s63amg"] = {"Mercedes_amg_s63_2014", 0,""},
	["amggt"] = {"Mercedes_AMGGT", 0,""},
	["slsamg"] = {"Mercedes_benz_SLS", 0,""},
	["c63w205"] = {"Mercedes_C63", 0,""},
	["rmodpagani"] = {"PaganiHuayra", 0,""},
	["718boxster"] = {"Porsche_718Boxter", 0,""},
	["718caymans"] = {"Porsche_718Cayman", 0,""},
	["palameila"] = {"Porsche_Panamera", 0,""},
	["pcs18"] = {"PorsheCayenne", 0,""},
	["macanpd600m"] = {"PorsheMacan", 0,""},
	["rculi"] = {"Rolls_Royce", 0,""},
	["17highcountry"] = {"Silverado_2500", 0,""},
	["skyline"] = {"skyline", 0,""},
	["supra2"] = {"toyota_supra", 0,""},
	["cali57"] = {"Ferrari_250_GT_California", 0,""},
	["lw458s"] = {"Ferrari458", 0,""},
	["mux"] = {"Isuzu_D_MAX", 0,""},
	["urus2018"] = {"Lamborghini_Urus", 0,""},
	["lp570"] = {"LamborghiniGallardo", 0,""},
	["lamtmc"] = {"lambota", 0,""},
	["vsrx7"] = {"MazdaRX7", 0,""},
	["fordh"] = {"MustangHoornicorn", 0,""},
	["ellie6str"] = {"Vapid_Drift_Ellie", 0,""},
	["zentenario"] = {"zentenario", 0,""},
	["biz25"] = {"Biz", 0,""},
	["BMWS"] = {"BMWS1000", 0,""},
	["bros60"] = {"bros", 0,""},
	["cbrr"] = {"cb1000", 0,""},
	["cgbol"] = {"cgbolinha", 0,""},
	["hayabusa"] = {"hayabusa", 0,""},
	["r1"] = {"R1", 0,""},
	["r6"] = {"R6", 0,""},
	["gsxr"] = {"Suzuki_gsxr_1000_srad", 0,""},
	["z1000"] = {"z1000", 0,""},
	["zx10r"] = {"zx10r", 0,""},

    -- Carros VIPS --
  },

  ["Garagem (Caminhao)"] = {
    _config = {gtype="garagem", vtype="car", blipid=477,blipcolor=68},
    ["daftruck"] = {"Daf XF Euro 6", 0, ""},
    ["kamaztrucker"] = {"Kamaz 5490", 0, ""},
    ["mantrucker"] = {"Man TGX V8", 0,""},
	["mercedestrucker"] = {"Mercedes-Benz Actros", 0,""},
	["scaniatrucker"] = {"Scania R730", 0,""},
	["volvotrucker"] = {"Volvo FH 500", 0,""}	
  },

  ["Garagem (PMERJ)"] = {
    _config = {gtype="policia", vtype="car",blipid=357,blipcolor=49, permissions={"pmerj.garagem"}},
    ["police4"] = {"Duster (PMERJ)",0,""},
    ["usafmerit"] = {"Ford Taurus (PMERJ)",0,""},
    --["logapmrj"] = {"Logan (PMERJ)",0,""},
    ["s10pmrj"] = {"S10 (PMERJ)",0,""},
    ["votagepmrj"] = {"Voyage (PMERJ)",0,""}
  },

  ["Garagem (BOPE)"] = {
    _config = {gtype="policia", vtype="car",blipid=357,blipcolor=49, permissions={"bope.garagem"}},
    ["riot"] = {"Caveirão (BOPE)",0,""},
    ["s10fechada"] = {"S10 Fechada (BOPE)",0,""},
    ["s10abertabop"] = {"S10 Normal (BOPE)",0,""}
  },

  ["Garagem (PF)"] = {
    _config = {gtype="policia", vtype="car", blipid=357,blipcolor=49,permissions={"pf.garagem"}},
    ["fbi2"] = {"L200 (PF)",0,""},
	["sheriff2"] = {"charger (PF)",0,""},
	["CHARGERPF"] = {"CHARGER2 (PF)",0,""},
	["hiluxsrv"] = {"hilux (PF)",0,""},
	["trailprf"] = {"trail (PF)",0,""},
  },
  
  ["Garagem (UNIMED)"] = {
    _config = {gtype="policia", vtype="car",blipid=357,blipcolor=49, permissions={"unimed.garagem"}},
    ["ambulance"] = {"Ambulancia (UNIMED)",0,""},
    ["tigerunimed"] = {"Tiger (UNIMED)",0,""}
  },
  
  ["Garagem (TÁXI)"] = {
    _config = {gtype="policia", vtype="car",blipid=198,blipcolor=70, permissions={"taxi.garagem"}},
    ["taxi"] = {"Taxi (Voyage)",0,""}
  },
  
  ["Garagem (MECANICO)"] = {
    _config = {gtype="policia", vtype="car",blipid=85,blipcolor=64, permissions={"mecanico.garagem"}},
    ["towtruck"] = {"Guincho (Caminhonete)",0,""},
	["flatbed"] = {"Guincho (Rebocador)",0,""}
  },
  ["Garagem (SEDEX)"] = {
    _config = {gtype="policia", vtype="car",blipid=67,blipcolor=5, permissions={"sedex.garagem"}},
    ["burrito3"] = {"Van (Sedex)",0,""}
  },
  ["Inicial"] = {
    _config = {gtype="policia", vtype="bike",blipid=226,blipcolor=5},
    ["cruiser"] = {"Bike Estiloso",1000,""},
    ["scorcher"] = {"Bike Esportiva",1300,""}
  },
  ["jatos"] = {
    _config = {gtype="policia", vtype="bike",blipid=226,blipcolor=5},
    ["cfa44"] = {"Bike CFA-44",50000000,""},
    ["volatus"] = {"volatus",5000000,""}
  },

  ["aguia"] = {
    _config = {gtype="policia", blipid=481,blipcolor=1,permissions={"pmerj.garagem"}},
    ["maverick"] = {"Águia PMERJ",0,""},
	["polmav"] = {"Águia PF",0,""},
  },

  ["heli"] = {
    _config = {gtype="policia", blipid=481,blipcolor=1,permissions={"unimed.garagem"}},
    ["supervolito"] = {"Águia",0,""},
  },

}

-- {garage_type,x,y,z}
cfg.garages = {
  {"Garagem", -60.254680633545,-1110.9229736328,26.435796737671}, 
  {"heli", 351.57598876953,-588.09686279297,74.165641784668}, 
  {"Garagem", 927.66534423828,1736.8531494141,166.03117370605}, 
  {"Garagem", 3721.2729492188,4519.50390625,21.259973526001}, 
  {"Garagem", 215.67091369629,-786.79925537109,30.831867218018}, 
  {"Garagem", 437.43130493164,-1013.003112793,28.635204315186},
  {"Garagem", 286.9504699707,-593.41424560547,43.134685516357}, 
  {"Garagem", 761.58142089844,-311.06945800781,59.8815574646}, 
  {"Garagem", -581.20434570313,-1639.4659423828,19.532028198242},
  {"Garagem", -966.12176513672,-1481.1160888672,5.0177545547485},
  {"Garagem", 1383.7546386719,-742.23858642578,67.198936462402},
  {"Garagem (Caminhao)", 26.533458709717,-2490.5747070313,6.0066828727722},
  {"Garagem (PMERJ)", 450.63995361328,-1021.9383544922,28.44063949585},
  {"Garagem (PF)", 450.63995361328,-1021.9383544922,28.44063949585},
  {"Garagem (BOPE)", 450.63995361328,-1021.9383544922,28.44063949585},
  {"Garagem (UNIMED)", 290.43701171875,-610.64666748047,43.371150970459},
  {"Garagem (TÁXI)",907.38049316406,-175.86546325684,74.130157470703},
  {"Garagem (MECANICO)",490.00009155273,-1333.2338867188,29.332311630249}, 
  {"Garagem (SEDEX)",70.49878692627,116.35168457031,79.126335144043},
  {"Inicial",252.86505126953,-375.96463012695,44.461822509766},
  {"aguia",449.29376220703,-981.30316162109,43.691646575928},
  {"jatos",-33.738082885742,-1105.1447753906,35.35054397583},
  {"jatos",186.79432678223,-920.18829345703,32.396129608154},
  {"jatos",-50.674766540527,777.18273925781,228.92712402344},
  {"jatos",-185.65110778809,882.09716796875,234.72222900391},
  {"jatos",-111.56313323975,959.43853759766,236.3074798584},
  {"jatos",-1067.4884033203,-2944.9750976563,13.947045326233},
  {"jatos",-2572.6755371094,1866.3825683594,168.83323669434},
}

return cfg