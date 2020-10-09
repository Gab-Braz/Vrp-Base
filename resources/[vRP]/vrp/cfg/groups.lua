
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Parabéns você é um SuperAdmin."}) end},
    "player.group.remove",
    "player.group.add",
    "player.givemoney",
    "player.giveitem",
	"player.blips",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"admin.deleteveh",
	"emergency.revive",
	"admin.spawnveh",
	"admin.godmode",
	"player.tptowaypoint",
	"admin.spikes",
    "player.tpto",
	"admin.easy_unjail",
  "admin.bm_freeze",
  "god.mode",
  "fixar.carro",
  "admin.revive",
  "admin.tickets",
  "menu.fac",
  "admin.fix",
  },
  ["admin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Parabéns você é um Admin."}) end},
    "player.group.remove",
    "player.group.add",
    "player.giveitem",
	"player.blips",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"admin.deleteveh",
	"emergency.revive",
	"admin.spawnveh",
	"admin.godmode",
	"player.tptowaypoint",
	"admin.spikes",
    "player.tpto",
	"admin.easy_unjail",
  "admin.bm_freeze",
  "god.mode",
  "fixar.carro",
  "admin.revive",
  "admin.tickets",
  "admin.fix"
  },
  ["moderador"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Parabéns você é um Moderador."}) end},
    "player.group.remove",
    "player.group.add",
    "player.giveitem",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.coords",
    "player.tptome",
	"admin.deleteveh",
	"emergency.revive",
	"admin.spawnveh",
	"admin.godmode",
	"player.tptowaypoint",
	"admin.spikes",
    "player.tpto",
	"admin.easy_unjail",
  "admin.bm_freeze",
  "fixar.carro",
  "admin.revive",
  "admin.tickets",
  "admin.fix"
  },
  ["suporte"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Parabéns você é um Suporte."}) end},
    "player.group.remove",
    "player.group.add",
    "player.giveitem",
    "admin.announce",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.coords",
    "player.tptome",
	"admin.deleteveh",
	"emergency.revive",
	"admin.spawnveh",
	"admin.godmode",
	"player.tptowaypoint",
	"admin.spikes",
    "player.tpto",
	"admin.easy_unjail",
  "admin.bm_freeze",
  "fixar.carro",
  "admin.revive",
  "admin.tickets"
  },
  
  -- Grupo padrao ao Logar
  ["user"] = {
    "player.phone",
    "player.calladmin",
    "police.askid",
    "police.store_weapons",
    "police.seizable",
    "forca.academia",
    "imposto.bolado",
    "player.capuz"
  },
  
  --VIP'S
  ["VIP Diamante"] = {
    _config = {gtype="vip",onspawn = function(player) vRPclient.notify(player,{"~r~Você é um VIP Diamante."}) end},
    "donater.loadshop",
    "vip4.paycheck"
  },
  
  ["VIP Platina"] = {
    _config = {gtype="vip",onspawn = function(player) vRPclient.notify(player,{"~r~Você é um VIP Platina."}) end},
    "donater.loadshop",
    "vip3.paycheck"
  },
  
  ["VIP Ouro"] = {
    _config = {gtype="vip",onspawn = function(player) vRPclient.notify(player,{"~r~Você é um VIP Ouro."}) end},
    "donater.loadshop",
    "vip2.paycheck"
  },
  
  ["VIP Prata"] = {
    _config = {gtype="vip",onspawn = function(player) vRPclient.notify(player,{"~r~Você é um VIP Prata."}) end},
    "donater.loadshop",
    "vip1.paycheck"
  },
  
  --ORGANIZACOES
  ["[PF] Delegado Chefe"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
	"pmerj.garagem",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "comandante.kit",
  "policia.avisos",
  "comandantepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PF] Delegado Adjunto"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
	"pmerj.garagem",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "cel.kit",
  "policia.avisos",
  "coronelpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PF] Perito Criminal"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
	"pmerj.garagem",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "tencel.kit",
  "policia.avisos",
  "tencoronelpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PF] Escrivão"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
	"pmerj.garagem",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "major.kit",
  "policia.avisos",
  "majorpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PF] Investigador"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
	"pmerj.garagem",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "capitao.kit",
  "policia.avisos",
  "capitaopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PF] Agente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
	"pmerj.garagem",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pf.garagem",
    "pf.roupa",
    "ten1.kit",
  "policia.avisos",
  "1tenentepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },
  ["[PMERJ] Comandante"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "comandante.kit",
  "policia.avisos",
  "comandantepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro",
  "police.alerta"
  },

  ["[PMERJ] Coronel"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "cel.kit",
  "policia.avisos",
  "coronelpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Ten. Coronel"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "tencel.kit",
  "policia.avisos",
  "tencoronelpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Major"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "major.kit",
  "policia.avisos",
  "majorpm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Capitao"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "capitao.kit",
  "policia.avisos",
  "capitaopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] 1º Tenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "ten1.kit",
  "policia.avisos",
  "1tenentepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] 2º Tenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "ten2.kit",
  "policia.avisos",
  "2tenentepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] SubTenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "subten.kit",
  "policia.avisos",
  "subtenentepm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] 1º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "sgt1.kit",
  "policia.avisos",
  "3sargentopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] 2º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "sgt2.kit",
  "policia.avisos",
  "2sargentopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] 3º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "sgt3.kit",
  "policia.avisos",
  "3sargentopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Cabo"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "cabo.kit",
  "policia.avisos",
  "cabopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Soldado"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "soldado.kit",
  "policia.avisos",
  "soldadopm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[PMERJ] Recruta"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "pmerj.garagem",
    "pmerj.roupa",
    "recruta.kit",
  "policia.avisos",
  "recrutapm.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Comandante"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "comandante.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "comandantebope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Coronel"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "cel.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "coronelbope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.porta.coronel",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Ten. Coronel"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "tencel.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "tencoronelbope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Major"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "major.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "majorbope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Capitao"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "capitao.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "capitaobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] 1º Tenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "ten1.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "1tenentebope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] 2º Tenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "ten2.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "2tenentebope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Sub-Tenente"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "subten.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "subtenentebope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] 1º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "sgt1.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "1sargentobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] 2º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "sgt2.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "2sargentobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] 3º Sargento"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "sgt3.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "3sargentobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Cabo"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "cabo.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "cabobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[BOPE] Soldado"] = {
    _config = {
      gtype = "job",
      onjoin = function(player) vRPclient._setCop(player,true) end,
      onspawn = function(player) vRPclient._setCop(player,true) end,
      onleave = function(player) vRPclient._setCop(player,false) end
    },
    "menu.policia",
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.drag",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.jail",
    "police.fine",
    "police.announce",
    "-police.store_weapons",
    "-police.seizable",
    "soldado.kit",
    "bope.garagem",
    "bope.roupa",
  "policia.avisos",
  "soldadobope.paycheck",
  "police.store_money",
  "police.easy_jail",
  "police.easy_unjail",
  "police.easy_fine",
  "police.easy_cuff",
  "police.spikes",
  "police.askid",
  "police.drag",
  "police.bm_freeze",
  "policia.revistar",
  "policia.porta",
  "policia.assalto",
  "fixar.carro"
  },

  ["[Unimed] Diretor"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
	"unimed.garagem",
    "unimed.kit",
  "menu.unimed",
  "diretorunimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Sub-Diretor"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
	"unimed.garagem",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "subdiretorunimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Doutor"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
	"unimed.garagem",
    "emergency.shop",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "doutorunimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Cirurgiao"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
	"unimed.garagem",
    "emergency.shop",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "cirurgiaounimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Medico"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
	"unimed.garagem",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "medicounimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Socorrista"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
	"unimed.garagem",
    "unimed.kit",
  "menu.unimed",
  "socorristaunimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Enfermeiro"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
    "unimed.kit",
	"unimed.garagem",
  "menu.unimed",
  "enfermeirounimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Paramedico"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
	"unimed.garagem",
    "emergency.shop",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "paramedicounimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[Unimed] Estagiario"] = {
    _config = {
      gtype = "job"
    },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
    "unimed.kit",
  "menu.unimed",
  "unimed.garagem",
  "estagiariounimed.paycheck",
  "unimed.garagem",
  "unimed.roupa",
  "fixar.carro"
  },

  ["[MAFIA] Chefe"] = {
    _config = {
      gtype = "job"
    },
    "mafia.loadshop",
	"pescar.tartaruga",
  "vender.tartaruga",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[MAFIA] Sub-Chefe"] = {
    _config = {
      gtype = "job"
    },
    "mafia.loadshop",
  "lavagem.dinheiro",
  "pescar.tartaruga",
  "vender.tartaruga",
  "menu.fac"
  },

  ["[MAFIA] Gerente"] = {
    _config = {
      gtype = "job"
    },
    "mafia.loadshop",
	"pescar.tartaruga",
  "vender.tartaruga",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[MAFIA] Membro"] = {
    _config = {
      gtype = "job"
    },
    "mafia.loadshop",
	"pescar.tartaruga",
  "vender.tartaruga",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[M.C] Chefe"] = {
    _config = {
      gtype = "job"
    },
    "motoclube.loadshop",
	"colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[M.C] Sub-Chefe"] = {
    _config = {
      gtype = "job"
    },
    "motoclube.loadshop",
	"colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[M.C] Gerente"] = {
    _config = {
      gtype = "job"
    },
    "motoclube.loadshop",
	"colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[M.C] Membro"] = {
    _config = {
      gtype = "job"
    },
    "motoclube.loadshop",
	"colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
  "lavagem.dinheiro",
  "menu.fac"
   },

  ["[YAKUZA] Chefe"] = {
    _config = {
      gtype = "job"
    },
  "yakuza.loadshop",
  "lavagem.dinheiro",
  "pescar.tartaruga",
  "vender.tartaruga",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[YAKUZA] Sub-Chefe"] = {
    _config = {
      gtype = "job"
    },
    "yakuza.loadshop",
  "lavagem.dinheiro",
  "pescar.tartaruga",
  "vender.tartaruga",
  "lavagem.dinheiro",
  "menu.fac"
  },

  ["[YAKUZA] Gerente"] = {
    _config = {
      gtype = "job"
    },
    "yakuza.loadshop",
    "lavagem.dinheiro",
    "pescar.tartaruga",
    "vender.tartaruga",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[YAKUZA] Membro"] = {
    _config = {
      gtype = "job"
    },
    "yakuza.loadshop",
    "lavagem.dinheiro",
    "pescar.tartaruga",
    "vender.tartaruga",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[C.V] Lider"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cocaina",
    "processar.cocaina",
    "vender.cocaina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[C.V] Sub-Lider"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cocaina",
    "processar.cocaina",
    "vender.cocaina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[C.V] Braço Direito"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cocaina",
    "processar.cocaina",
    "vender.cocaina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[C.V] Membro"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cocaina",
    "processar.cocaina",
    "vender.cocaina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[F.D.N] Lider"] = {
    _config = {
      gtype = "job"
    },
    "colher.maconha",
    "processar.maconha",
    "vender.maconha",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[F.D.N] Sub-Lider"] = {
    _config = {
      gtype = "job"
    },
    "colher.maconha",
    "processar.maconha",
    "vender.maconha",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[F.D.N] Braço Direito"] = {
    _config = {
      gtype = "job"
    },
    "colher.maconha",
    "processar.maconha",
    "vender.maconha",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[F.D.N] Membro"] = {
    _config = {
      gtype = "job"
    },
    "colher.maconha",
    "processar.maconha",
    "vender.maconha",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[T.C.P] Lider"] = {
    _config = {
      gtype = "job"
    },
    "colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[T.C.P] Sub-Lider"] = {
    _config = {
      gtype = "job"
    },
    "colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[T.C.P] Braço Direito"] = {
    _config = {
      gtype = "job"
    },
    "colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["[T.C.P] Membro"] = {
    _config = {
      gtype = "job"
    },
    "colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
    "lavagem.dinheiro",
    "menu.fac"
  },

  ["Traficante de Tartaruga"] = {
    _config = {
      gtype = "job"
    },
    "pescar.tartaruga",
    "vender.tartaruga",
    "lavagem.dinheiro"
  },

  ["Traficante de Cocaina"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cocaina",
    "processar.cocaina",
    "vender.cocaina",
    "lavagem.dinheiro"
  },

  ["Traficante de Maconha"] = {
    _config = {
      gtype = "job"
    },
    "colher.maconha",
    "processar.maconha",
    "vender.maconha",
    "lavagem.dinheiro"
  },

  ["Traficante de Metanfetamina"] = {
    _config = {
      gtype = "job"
    },
    "colher.meta",
    "processar.metanfetamina",
    "vender.metanfetamina",
    "lavagem.dinheiro"
  },

  ["Hacker"] = {
    _config = {
      gtype = "job"
    },
    "pegar.cartao",
    "clonar.cartao",
    "vender.cartaoclonado",
    "lavagem.dinheiro",
    "hacker.hack"
  },

  ["Ladrao de Carros"] = {
    _config = {
      gtype = "job"
    },
    "carjacker.lockpick",
    "mission.carjack.vehicle"
  },

  ["Assaltante"] = {
    _config = {
      gtype = "job"
    },
    "mugger.mug"
  },

  ["Advogado"] = {
    _config = {
      gtype = "job"
    },
    "advogado.oab",
	"advogado.service"
  },

  ["Minerador"] = {
    _config = {
      gtype = "job"
    },
    "pegar.minerio",
    "processar.prata",
    "processar.cobre",
    "processar.ouro",
    "venda.prata",
    "venda.cobre",
    "venda.ouro",
  },

  ["Mecânico"] = {
    _config = {
      gtype = "job"
    },
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "mission.repair.satellite_dishes",
    "mission.repair.eolic",
    "mecanico.kit",
    "mecanico.paycheck",
  "mecanico.garagem",
  "menu.mecanico",
  },
  
  ["Taxista"] = {
    _config = {
      gtype = "job"
    },
    "taxi.service",
    "taxi.garagem",
    "taxi.paycheck"
  },

  ["Sedex"] = {
    _config = {
      gtype = "job"
    },
    "sedex.permissao",
    "sedex.paycheck",
	"sedex.garagem"
  },

  ["Convênio Unimed"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Você é um Conveniado da Unimed."}) end},
  },

  ["Pescador"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Você é um Pescador."}) end, gtype="job"},
    "venda.peixe"
  },


  ["cnh"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Você possui CNH."}) end},
  },
  ["porte"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"~r~Você possui Porte de armas."}) end},
  },


}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
}

return cfg
