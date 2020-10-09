-- this file is used to define additional static blips and markers to the map
-- some lists: https://wiki.gtanet.work/index.php?title=Blips

local cfg = {}

-- list of blips
-- {x,y,z,idtype,idcolor,text}
cfg.blips = {
  {-1202.96252441406,-1566.14086914063,4.61040639877319,311,17,"Academia"}, 
  {722.38897705078,-300.23257446289,56.868129730225,84,62,"Favela do Campinho"},
  {3509.6589355469,4580.759765625,53.422592163086,84,62,"Favela da Serra do Mar"},
  {1371.9632568359,-580.34759521484,74.380355834961,84,62,"Favela do Helipa"},
  {926.82385253906,1727.68359375,166.3267364502,84,62,"Favela do Interior"},
  {117.19,-1294.86,28.42, 121, 1, "Strip Club"},
  {-605.25970458984,-1633.6148681641,33.034160614014, 150, 62, "MotoClube Armas"},
  {1486.7905273438,1131.0593261719,114.33668518066, 150, 62, "Mafia Armas"},
  {-971.31164550781,-1482.5678710938,5.0128364562988, 437, 62, "Fazenda"},
  {-971.31164550781,-1482.5678710938,5.0128364562988, 437, 62, "Yakuza"},
  {-899.06243896484,-1445.5875244141,7.5268006324768, 150, 62, "Yakuza Armas"},
  {-581.67108154297,-1640.3321533203,19.531282424927, 226, 62, "MotoClube"},
  {2224.0710449219,5577.1396484375,53.841327667236, 140, 25, "Campo de Maconha"},
  {79.686859130859,3705.6840820313,41.077156066895, 499, 4, "Campo de Metanfetamina"},
  {1219.7586669922,-3201.6318359375,5.5280680656433, 140, 25, "Processamento de Maconha"},
  {-559.17358398438,-1803.5139160156,22.611957550049, 500, 39,"Lavagem de Dinheiro"},
  {3724.9382324219,4525.3305664063,22.47049331665, 140, 25, "Venda de Maconha"},
  {-539.86431884766,-1637.9422607422,19.892698287964, 499, 4, "Venda de Metanfetamina"},
  {886.185546875,1859.0792236328,145.30047607422, 501, 4, "Venda de Cocaina"},
  {764.65142822266,-3202.8679199219,6.0672149658203, 499, 4, "Processamento de Metanfetamina"},
  {1998.6602783203,4839.1049804688,43.548267364502, 501, 4, "Campo de Cocaina"},
  {824.03259277344,-2997.0610351563,6.0209364891052, 501, 4, "Processamento de Cocaina"},
  {3586.5190429688,5671.7709960938,0.20234614610672, 68, 25, "Pescar Tartaruga"},
  {-873.31213378906,-1457.9019775391,7.5268039703369, 68, 25, "Vender Tartaruga"},
  {261.30688476563,204.34764099121,110.28717803955, 521, 62, "Hackear Cartoes"},
  {-1054.0205078125,-230.26893615723,44.020957946777, 521, 62, "Pegar Cartoes"},
  {1275.0648193359,-1710.6457519531,54.771488189697, 521, 62, "Vender Cartoes"},
  {2633.0002441406,2933.6105957031,44.738971710205, 478, 55, "Campo de Minerio"},
  {2681.8464355469,2796.1042480469,40.698238372803, 478, 56, "Processamento de Cobre"},
  {2765.3095703125,2802.2033691406,41.85054397583, 478, 62, "Processamento de Prata"},
  {2947.9953613281,2744.9382324219,43.339771270752, 478, 60, "Processamento de Ouro"},
  {-1123.7114257813,4893.2827148438,218.47244262695, 479, 62, "Venda de Prata"},
  {-1113.2465820313,4903.7563476563,218.59519958496, 479, 56, "Venda de Cobre"},
  {-1075.6470947266,4897.8950195313,214.27136230469, 479, 60, "Venda de Ouro"},
  {242.9522857666,223.93110656738,106.28684234619, 408, 1, "Carteira OAB"},
  {-205.66911315918,-1309.5469970703,31.283937454224, 72, 4, "Los Santos Customs"},
  {722.68084716797,-1088.8745117188,21.779186248779, 72, 4, "Los Santos Customs"},
  {-1144.9637451172,-1990.3760986328,13.161549568176, 72, 4, "Los Santos Customs"},
  {1174.5942382813,2647.1813964844,37.776111602783, 72, 4, "Los Santos Customs"},
  {1322.645,-1651.976,52.275,362,2,"Loja de Tatuagem"},
  {-1153.676,-1425.68,4.954,362,2,"Loja de Tatuagem"},
  {322.139,180.467,103.587,362,2,"Loja de Tatuagem"},
  {-3170.071,1075.059,20.829,2,"Loja de Tatuagem"},
  {1864.633,3747.738,33.032,362,2,"Loja de Tatuagem"},
  {-293.713,6200.04,31.487,362,2,"Loja de Tatuagem"},
  {232.10229492188,-397.64651489258,47.924365997314, 480, 1, "Mudar de Sexo"},
  {-1655.5744628906,-1000.3677978516,13.017545700073,68, 2, "Vender peixes"}
}

-- list of markers
-- {type,x,y,z,sx,sy,sz,r,g,b,a,visible_distance}
cfg.markers = {

--MACONHA
{23,1039.1921386719,-3205.3518066406,-38.166553497314,1,1,0.8,204,204,0,150,35}, --PROCESSAMENTO

--COCAINA
{23,1099.9050292969,-3194.1301269531,-38.993461608887,1,1,0.8,204,204,0,150,35}, --PROCESSAMENTO

--META
{23,1005.6068115234,-3200.0974121094,-38.519367218018,1,1,0.8,204,204,0,150,35} --PROCESSAMENTO
}
cfg.custom_markers = {
	--{id,x,y,z,rx,ry,rz,sx,sy,sz,r,g,b,a,view_distance,rotate}
}

return cfg