cfg = {}

cfg.blips = true -- enable blips

cfg.seconds = 1800 -- TEMPO DO ASSALTO EM SEGUNDOS

cfg.cooldown = 3600 -- TEMPO DO COOLDOWN EM SEGUNDOS

cfg.cops = 4 -- MINIMO DE PM'S ON
cfg.permission = "policia.assalto" -- permission given to cops

cfg.banks = { -- list of banks
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = 700000 + math.random(0,100000),
		nameofbank = "Banco da Praça",
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 }, 
		reward = 400000 + math.random(0,0),
		nameofbank = "Banco da Praia",
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = 400000 + math.random(0,0),
		nameofbank = "Banco de Paleto Bay",
		lastrobbed = 0
	},
	["fleeca3"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		reward = 500000 + math.random(0,0),
		nameofbank = "Banco perto do BW Studios",
		lastrobbed = 0
	},
	["fleeca4"] = {
		position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 48.0463104248047 },
		reward = 500000 + math.random(0,0),
		nameofbank = "Banco perto da Los Santos Customs",
		lastrobbed = 0
	},
	["fleeca5"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		reward = 500000 + math.random(0,0),
		nameofbank = "Banco perto da Prefeitura",
		lastrobbed = 0
	},
	["fleeca6"] = {
		position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		reward = 400000 + math.random(0,0),
		nameofbank = "Banco do Deserto",
		lastrobbed = 0
	},
	["pacific"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = 1000000 + math.random(0,0),
		nameofbank = "Banco Central",
		lastrobbed = 0
	}
}