cfg = {}

cfg.blips = true -- enable blips

cfg.seconds = 600 -- seconds to rob

cfg.cooldown = 1200 -- time between robbaries

cfg.cops = 2 -- minimum cops online
cfg.permission = "policia.assalto" -- permission given to cops

cfg.holdups = { -- list of stores
	["paleto_twentyfourseven"] = {
		position = { ['x'] = 1734.48046875, ['y'] = 6420.38134765625, ['z'] = 34.5372314453125 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Paleto Bay)",
		lastrobbed = 0 -- this is always 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { ['x'] = 1960.7580566406, ['y'] = 3749.26367187, ['z'] = 31.3437423706055 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Sandy Shores)",
		lastrobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { ['x'] = -709.17022705078, ['y'] = -904.21722412109, ['z'] = 19.215591430664 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Little Seoul)",
		lastrobbed = 0
	},
	["southlossantos_gasstop"] = {
		position = { ['x'] = 28.7538948059082, ['y'] = -1339.8212890625, ['z'] = 29.4970436096191 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Posto de Gasolina (South Los Santos)",
		lastrobbed = 0
	},
	["southlossantos_twentyfourseven"] = {
		position = { ['x'] = -43.1531448364258, ['y'] = -1748.75244140625, ['z'] = 29.4209976196289 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (South Los Santos)",
		lastrobbed = 0
	},
	["vinewood_twentyfourseven"] = {
		position = { ['x'] = 378.030487060547, ['y'] = 332.944427490234, ['z'] = 103.566375732422 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Vinewood)",
		lastrobbed = 0
	},
	["eastlossantos_robsliquor"] = {
		position = { ['x'] = 1126.68029785156, ['y'] = -980.39501953125, ['z'] = 45.4157257080078 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (East Los Santos)",
		lastrobbed = 0
	},
	["sandyshores_twentyfourseven"] = {
		position = { ['x'] = 2673.32006835938, ['y'] = 3286.4150390625, ['z'] = 55.241138458252 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Sandy Shores)",
		lastrobbed = 0
	},
	["grapeseed_gasstop"] = {
		position = { ['x'] = 1707.52648925781, ['y'] = 4920.05126953125, ['z'] = 42.0636787414551 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Posto de Gasolina (Grapeseed)",
		lastrobbed = 0
	},
	["morningwood_robsliquor"] = {
		position = { ['x'] = -1479.22424316406, ['y'] = -375.097686767578, ['z'] = 39.1632804870605 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Morning Wood)",
		lastrobbed = 0
	},
	["chumash_robsliquor"] = {
		position = { ['x'] = -2959.37524414063, ['y'] = 387.556365966797, ['z'] = 14.043158531189 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Chumash)",
		lastrobbed = 0
	},
	["delperro_robsliquor"] = {
		position = { ['x'] = -1220.14123535156, ['y'] = -915.712158203125, ['z'] = 11.3261671066284 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Del Perro)",
		lastrobbed = 0
	},
	["eastlossantos_gasstop"] = {
		position = { ['x'] = 1160.06237792969, ['y'] = -314.061828613281, ['z'] = 69.2050628662109 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Posto de Gasolina (East Los Santos)",
		lastrobbed = 0
	},
	["tongva_gasstop"] = {
		position = { ['x'] = -1829.00427246094, ['y'] = 798.903076171875, ['z'] = 138.186706542969 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Posto de Gasolina (Tongva Valley)",
		lastrobbed = 0
	},
	["tataviam_twentyfourseven"] = {
		position = { ['x'] = 2549.400390625, ['y'] = 385.048309326172, ['z'] = 108.622955322266 },
		reward = 10000 + math.random(1000,7000),
		nameofstore = "Loja (Tataviam Mountains)",
		lastrobbed = 0
	},
	["rockford_jewlery"] = {
		position = { ['x'] = -621.989135742188, ['y'] = -230.804443359375, ['z'] = 38.0570297241211 },
		reward = 100000 + math.random(1000,7000),
		nameofstore = " Joalheria (Rockford Hills)",
		lastrobbed = 0
	}
}