
local cfg = {}

-- PCs positions
cfg.pcs = {
  {441.06015014648,-978.62677001953,30.689605712891},
  {459.57409667969,-989.85266113281,24.914875030518}
}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police" -- service to alert when the tracking is successful
}

-- wanted display
cfg.wanted = {
  blipid = 458,
  blipcolor = 38,
  service = "police"
}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "folhademaconha",
  "cristal",
  "maconha",
  "metanfetamina",
  "folhadecoca",
  "cocaina",
  "folhadecoca",
  "tartaruga",
  "cartaoclonado",
  "cartaoclonadohack"
}

-- jails {x,y,z,radius}
cfg.jails = {
  {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  {459.305603027344,-997.873718261719,24.914867401123,2.1},
  {459.999938964844,-994.331298828125,24.9148578643799,1.6}
}

-- fines
-- map of name -> money
cfg.fines = {
  ["Desacato."] = 5000,
  ["Fuga"] = 2500,
  ["Sem habilitação"] = 2000,  
  ["Assalto a Civil"] = 5000,
  ["Porte ilegal de arma"] = 10000,
  ["Tráfico de drogas"] = 10000,
  ["Alta Velocidade"] = 1000,
  ["Direção Perigosa"] = 3000,
  ["Ultrapassar sinal vermelho"] = 1000,
  ["Furto/Roubo de veículos."] = 5000,
  ["Poluição Sonora"] = 2500,
  ["Assasinato."] = 15000,
  ["Tentativa de homicídio."] = 10000,
  ["Roubo a Banco."] = 25000,
  ["Roubo a Loja."] = 15000
}

return cfg
