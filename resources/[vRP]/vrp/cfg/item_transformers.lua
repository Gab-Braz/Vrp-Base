local cfg = {}
 
-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition
 
cfg.item_transformers = {

  {
    name="Academia", -- menu name
    r=255,g=125,b=0, -- color
    max_units=10000,
    units_per_minute=30,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319, -- pos
    radius=5.5, height=3.5, -- area
    recipes = {
      ["Força"] = { -- action name
        description="Aumente sua força e stamina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 5.0 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
 
  --CAMPO DE MACONHA
  {
    name="Campo de Maconha", -- menu name
    permissions = {"colher.maconha"}, -- you can add permissions
    r=0,g=200000,b=0, -- color
    max_units=10000,
    units_per_minute=60,
    x=2224.0710449219,y=5577.1396484375,z=53.841327667236, -- pos 
    radius=3, height=1, -- area
    recipes = {
      ["Colher Folha de Maconha"] = { -- action name
        description="Folha de Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["folhademaconha"] = 1
        }
      }
    }
  },  
  -- CAMPO DE METANFETAMINA    
  {
    name="Campo de Metanfetamina", -- Nome do menu
    permissions = {"colher.meta"}, -- Você pode adicionar permissões
    r=0,g=200000,b=0, -- cor
    max_units=10000,
    units_per_minute=60,
    x=79.686859130859,y=3705.6840820313,z=41.077156066895, -- Localização
    radius=3, height=1, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher Cristal.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["cristal"] = 3
        }
      }
    }
  },
 
  {
    name="Processamento de Maconha", -- menu name
    permissions = {"processar.maconha"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=1039.3814697266,y=-3205.943359375,z=-38.166015625, -- pos 
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Maconha.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["folhademaconha"] = 1
        },
        products={ -- items given per unit
          ["maconha"] = 1
        }
      }
    }
  },
 
    -- LAVAGEM DE DINHEIRO
  {
    name = "Lavagem de Dinheiro", -- menu name
    permissions = {"lavagem.dinheiro"}, -- you can add permissions
    r = 0,
    g = 200,
    b = 0, -- cor do menu
    max_units = 9999999999999999, -- unidades maximas do item
    units_per_minute = 10000, -- unidades que o transformador ganha de volta por minuto
    x=1122.0144042969,y=-3196.5224609375,z=-40.398097991943, -- pos -2078.9152832031,2611.9431152344,3.105997800827
    radius = 5,
    height = 0.1, -- area
    recipes = {
      -- items do menu
      ["Lavar Dinheiro"] = {
        -- action name
        description = "Lavar Dinheiro.", -- action description
        in_money = 0, -- money taken per unit
        out_money = 8000, -- money earned per unit
        reagents = {
          -- items taken per unit
          ["dirty_money"] = 10000
        },
        products = {
          -- items given per unit
        }
      }
    }
  },  
 
 -- VENDER MACONHA
  {
    name="Vender Maconha", -- menu name
    permissions = {"vender.maconha"}, -- you can add permissions 1663.8977050781,-27.088855743408,173.77487182617
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=3724.9382324219,y=4525.3305664063,z=22.47049331665, -- pos 2238.0625,52.60005569458,247.22978210449
    radius=2.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Vender Maconha"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["maconha"] = 2
      },
        products={ -- items given per unit
          ["dirty_money"] = 140
        }
      }
    }
  },
 
  -- VENDER META
  {
    name="Vender Metanfetamina", -- menu name
    permissions = {"vender.metanfetamina"}, -- you can add permissions 1663.8977050781,-27.088855743408,173.77487182617
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=-539.86431884766,y=-1637.9422607422,z=19.892698287964, -- pos 1361.7149658203,-601.97735595703,77.328437805176
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Vender Metanfetamina"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["metanfetamina"] = 2
      },
        products={ -- items given per unit
          ["dirty_money"] = 140
        }
      }
    }
  },  
 
  -- VENDER COCA
  {
    name="Vender Cocaina", -- menu name
    permissions = {"vender.cocaina"}, -- you can add permissions 1663.8977050781,-27.088855743408,173.77487182617
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=886.185546875,y=1859.0792236328,z=145.30047607422, -- pos 
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Vender Cocaina"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["cocaina"] = 2
      },
        products={ -- items given per unit
          ["dirty_money"] = 200
        }
      }
    }
  },
 
  -- PROCESSADOR DE METANFETAMINA
  {
    name="Processamento de Metanfetamina", -- menu name
    permissions = {"processar.metanfetamina"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=1005.6068115234,y=-3200.0974121094,z=-38.519367218018, -- pos -103.42781829834,6206.5541992188,31.025024414063
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Metanfetamina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["cristal"] = 1
        },
        products={ -- items given per unit
          ["metanfetamina"] = 1
        }
      }
    }
  },
  -- CAMPO DE COCAINA    
  {
    name="Campo de Cocaina", -- Nome do menu
    permissions = {"pegar.cocaina"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=10000,
    units_per_minute=60,
    x=1998.6602783203,y=4839.1049804688,z=43.548267364502, -- Localização
    radius=3, height=1, -- area
    recipes = {
      ["Colher"] = { -- Nome da ação
        description="Colher Folha de Coca.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["folhadecoca"] = 3
        }
      }
    }
  },
  -- PROCESSADOR DE COCAINA
  {
    name="Processamento de Cocaina", -- menu name
    permissions = {"processar.cocaina"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=1099.9050292969,y=-3194.1301269531,z=-38.993461608887, -- pos
    radius=3, height=1.0, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar cocaina.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["folhadecoca"] = 1
        },
        products={ -- items given per unit
          ["cocaina"] = 1
        }
      }
    }
  },
  -- PESCADOR DE TARTARUGA
  {
    name="Pescador de Tartaruga", -- menu name
    permissions = {"pescar.tartaruga"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=3586.5190429688,y=5671.7709960938,z=0.20234614610672, -- pos
    radius=3.0, height=1.0, -- area
    recipes = { -- items do menu
      ["Pescar"] = { -- action name
        description="Pescar Tartaruga com Rede.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["rede"] = 1
      },
        products={ -- items given per unit
          ["tartaruga"] = 1
        }
      }
    }
  },
  -- VENDER TARTARUGA
  {
    name="Vender Tartaruga", -- menu name
    permissions = {"vender.tartaruga"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=-873.31213378906,y=-1457.9019775391,z=7.5268039703369,  -- pos 281.59823608398,6789.140625,15.864545822144
    radius=3.0, height=1.0, -- area
    recipes = { -- items do menu
      ["Vender Tartaruga"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["tartaruga"] = 2
      },
        products={ -- items given per unit
          ["dirty_money"] = 350
        }
      }
    }
  },
    -- Cartões clonáveis
  {
    name="Hackear Cartões", -- Nome do menu
    permissions = {"pegar.cartao"}, -- you can add permissions
    r=0,g=200,b=0, -- cor
    max_units=10000,
    units_per_minute=60,
    x=261.30688476563,y=204.34764099121,z=110.28717803955, -- Localização     261.30688476563,204.34764099121,110.28717803955
    radius=4.5, height=1.5, -- area
    recipes = {
      ["Pegar"] = { -- Nome da ação
        description="Pegar Cartões Clonáveis", -- Descrição do produto a se colher
        in_money=50, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={}, -- Itens colhidos por unidade
        products={ -- Nome do produto fornecido por unidade
          ["cartaoclonadohack"] = 1
        }
      }
    }
  },
    -- CLONAR CARTÕES
  {
    name="Pegar Cartões", -- menu name
    permissions = {"clonar.cartao"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=-1054.0205078125,y=-230.26893615723,z=44.020957946777, -- pos -119.17678833008,-1486.1040039063,36.98205947876
    radius=4.5, height=1.5, -- area
    recipes = { -- items do menu
      ["Clonar cartões"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["cartaoclonadohack"] = 1
      },
        products={ -- items given per unit
          ["cartaoclonado"] = 1
        }
      }
    }
  },
 
    -- VENDER CARTÕES CLONADOS
  {
    name="Vender Cartões", -- menu name
    permissions = {"vender.cartaoclonado"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=1275.0648193359,y=-1710.6457519531,z=54.771488189697, -- pos 1275.0648193359,-1710.6457519531,54.771488189697
    radius=3, height=1.0, -- area
    recipes = { -- items do menu
      ["Vender Cartões Clonados"] = { -- action name
        description="", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["cartaoclonado"] = 2
      },
        products={ -- items given per unit
          ["dirty_money"] = 200
        }
      }
    }
  },
  -- MINERADOR
  {
    name="Campo de Minerio", -- Nome do menu
    permissions = {"pegar.minerio"}, -- Você pode adicionar permissões
    r=0,g=200,b=0, -- cor
    max_units=10000,
    units_per_minute=60,
    x=2633.0002441406,y=2933.6105957031,z=44.738971710205, -- Localização
    radius=3, height=1.0, -- area
    recipes = {
      ["Minerar"] = { -- Nome da ação
        description="Coletar Minerio.", -- Descrição do produto a se colher
        in_money=0, -- Dinheiro dado por unidade
        out_money=0, -- Dinheiro ganho por unidade
        reagents={  -- items taken per unit
          ["picareta"] = 1
      },
        products={ -- items given per unit
          ["minerio"] = 2
        }
      }
    }
  },
 
  {
    name="Processamento de Prata", -- menu name
    permissions = {"processar.prata"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=2765.3095703125,y=2802.2033691406,z=41.85054397583, -- pos
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Minerio.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["minerio"] = 2
      },
        products={ -- items given per unit
        ["prata"] = 1,
        }
      }
    }
  },
 
  {
    name="Processamento de Cobre", -- menu name
    permissions = {"processar.cobre"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=2681.8464355469,y=2796.1042480469,z=40.698238372803, -- pos
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Minerio.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["minerio"] = 1
      },
        products={ -- items given per unit
        ["cobre"] = 1,
        }
      }
    }
  },
 
  {
    name="Processamento de Ouro", -- menu name
    permissions = {"processar.ouro"}, -- you can add permissions
    r=0,g=200,b=0, -- cor do menu
    max_units=10000, -- unidades maximas do item
    units_per_minute=60, -- unidades que o transformador ganha de volta por minuto
    x=2947.9953613281,y=2744.9382324219,z=43.339771270752, -- pos
    radius=3, height=1, -- area
    recipes = { -- items do menu
      ["Processar"] = { -- action name
        description="Processar Minerio.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={  -- items taken per unit
          ["minerio"] = 4
      },
        products={ -- items given per unit
        ["ouro"] = 1,
        }
      }
    }
  },

{
  name = "Venda de prata", -- menu name
  permissions = {"venda.prata"}, -- you can add permissions
  r = 0,
  g = 200,
  b = 0, -- cor do menu
  max_units = 9999999999999999, -- unidades maximas do item
  units_per_minute = 10000, -- unidades que o transformador ganha de volta por minuto
  x=-1123.7114257813,y=4893.2827148438,z=218.47244262695, -- pos
  radius = 5,
  height = 1, -- area
  recipes = {
    -- items do menu
    ["Vender prata"] = {
      -- action name
      description = "Vender prata.", -- action description
      in_money = 0, -- money taken per unit
      out_money = 500, -- money earned per unit
      reagents = {
        -- items taken per unit
        ["prata"] = 1
      },
      products = {
        -- items given per unit
      }
    }
  }
},  


{
  name = "Venda de cobre", -- menu name
  permissions = {"venda.cobre"}, -- you can add permissions
  r = 0,
  g = 200,
  b = 0, -- cor do menu
  max_units = 9999999999999999, -- unidades maximas do item
  units_per_minute = 10000, -- unidades que o transformador ganha de volta por minuto
  x=-1113.2465820313,y=4903.7563476563,z=218.59519958496, -- pos
  radius = 5,
  height = 1, -- area
  recipes = {
    -- items do menu
    ["Vender cobre"] = {
      -- action name
      description = "Vender cobre.", -- action description
      in_money = 0, -- money taken per unit
      out_money = 200, -- money earned per unit
      reagents = {
        -- items taken per unit
        ["cobre"] = 1
      },
      products = {
        -- items given per unit
      }
    }
  }
},

{
  name = "Venda de ouro", -- menu name
  permissions = {"venda.ouro"}, -- you can add permissions
  r = 0,
  g = 200,
  b = 0, -- cor do menu
  max_units = 9999999999999999, -- unidades maximas do item
  units_per_minute = 10000, -- unidades que o transformador ganha de volta por minuto
  x=-1075.6470947266,y=4897.8950195313,z=214.27136230469, -- pos
  radius = 5,
  height = 1, -- area
  recipes = {
    -- items do menu
    ["Vender ouro"] = {
      -- action name
      description = "Vender ouro.", -- action description
      in_money = 0, -- money taken per unit
      out_money = 1100, -- money earned per unit
      reagents = {
        -- items taken per unit
        ["ouro"] = 1
      },
      products = {
        -- items given per unit
      }
    }
  }
},

{
  name = "Venda de peixes", -- menu name
  permissions = {"venda.peixe"}, -- you can add permissions
  r = 0,
  g = 200,
  b = 0, -- cor do menu
  max_units = 9999999999999999, -- unidades maximas do item
  units_per_minute = 10000, -- unidades que o transformador ganha de volta por minuto
  x=-1655.5744628906,y=-1000.3677978516,z=13.017545700073, -- pos -1655.5744628906,-1000.3677978516,13.017545700073
  radius = 5,
  height = 1, -- area
  recipes = {
    -- items do menu
    ["Vender Salmão"] = {
      description = "Vender salmão, por 200 reais o KG.", -- action description
      in_money = 0, -- money taken per unit
      out_money = 200, -- money earned per unit
      reagents = {
        ["bass"] = 1
      },
      products = {}
    },

    ["Vender Robalo"] = {
      description = "Vender o robalo, por 150 reais o KG",
      in_money = 0,
      out_money = 150,
      reagents = {
        ["catfish"] = 1
      },
      products = {}
    }
  }
},

 
 
{
    name="OAB", -- menu name
    permissions = {"advogado.oab"},
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=242.9522857666,y=223.93110656738,z=106.28684234619,
    radius=3.5, height=1.0, -- area
    recipes = {
      ["OAB"] = { -- action name
       description="Carteira de Advogado.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
        ["oab"] = 1
        }, -- items given per unit
        aptitudes={} -- optional
      }
    }
}
}

cfg.hidden_transformers = {
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
    infos = {
    },
    positions = {
    },
    interval = 1, -- interval in minutes for the reseller respawn
    duration = 10, -- duration in minutes of the spawned reseller
    blipid = 133,
    blipcolor = 2
}
return cfg