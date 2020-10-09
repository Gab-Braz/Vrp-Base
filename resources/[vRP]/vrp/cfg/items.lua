-- define items, see the Inventory API on github

local cfg = {}

-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here
cfg.items = {
  ["folhademaconha"] = {"Folha de Maconha", "", nil, 1.0},
  ["cristal"] = {"Cristal de Metanfetemina", "", nil, 1.0},
  ["maconha"] = {"Maconha", "", nil, 1.0},
  ["metanfetamina"] = {"Metanfetemina", "", nil, 1.0},
  ["cocaina"] = {"Cocaina", "", nil, 1.0},
  ["folhadecoca"] = {"Folha de Cocaina", "", nil, 1.0},
  ["tartaruga"] = {"Tartaruga", "", nil, 1.0},
  ["cartaoclonado"] = {"Cartao Clonável", "", nil, 1.0}, 
  ["cartaoclonadohack"] = {"Prévia do Cartao", "", nil, 1.0},
  ["picareta"] = {"Picareta", "", nil, 1.0},
  ["minerio"] = {"Minerio", "", nil, 0.5},
  ["prata"] = {"Prata", "", nil, 1.0},
  ["ouro"] = {"Ouro", "", nil, 2.0},
  ["cobre"] = {"Cobre", "", nil, 1.0},
  ["oab"] = {"Carteira de Advogado", "", nil, 1.0},
  ["capuz"] = {"Capuz", "Para colocar em outras Pessoas", nil, 1.0},
  ["celular"] = {"Celular Nokia", "Ultra tecnologia", nil, 1.0},

  
  -- Itens de Comandos
  ["gps"] = {"GPS","<img src='http://s2.glbimg.com/izR65I8IY8B1fq8OfZsnuuhCZiI=/695x0/s.glbimg.com/po/tt2/f/original/2014/11/28/gps-garmin-nuvi-42-tela-43.jpg' width='200px'", nil, 0.5},
  ["vision"] = {"Máscara Térmica", "Usada para enxergar pelo calor", nil, 1.0},
  ["nitro"] = {"Nitro", "<img src='http://3.bp.blogspot.com/_QYNlAfmyGs8/TFSMsoMWiRI/AAAAAAAABHg/o8iTi6WJVi0/s400/nitro-carros.jpg' width='200px </br> Usado para turbinar seu carro pressionando tecla E'", nil, 1.0},
  
  -- Acessorios
  ["silenciador"] = {"Silenciador", "Funciona em várias Armas", nil, 1.0},
  ["lanterna"] = {"Lanterna", "Para colocar em Armas", nil, 0.80},
  ["grip"] = {"Empunhadura", "Para ter uma maior Precisao na Arma", nil, 0.80},
  ["skin"] = {"Pintura Dourada", "Deixe sua Arma com um Toque mais Bonito", nil, 0.01},

  -- Pescador
  ["vara"] = {"Vara de Pescar", "", nil, 1.0},
  ["bass"] = {"Salmão", "Peixe de ótima qualidade", nil, 1.0},
  ["catfish"] = {"Robalo", "Peixe", nil, 2.0},
  ["rede"] = {"Rede", "", nil, 1.0},
}

-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[Sun Happy vRP] Pacote de Itens ["..name.."] não encontrado")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg
