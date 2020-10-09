
-- this file configure the cloakrooms on the map

local cfg = {}

local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }



-- PMERJ
local farda_pmerj_1 = {model = "s_m_y_ranger_02"}
local farda_pmerj_2 = {model = "s_m_y_ranger_01"}

-- BOPE
local farda_bope_1 = {model = "s_m_y_swat_01"}
local farda_bope_2 = {model = "s_m_y_cop_01"}

--UNIMED
local farda_unimed_1 = {model = "s_m_m_doctor_01"}
local farda_unimed_2 = {model = "medicounimed"}
local farda_unimed_3 = {model = "s_m_m_paramedic_01"}
local farda_feminina_unimed_1 = {model = "unimedFem"}


local farda_pf = {model = "s_m_m_fibsec_01"}
local farda_pf1 = {model = "s_m_y_blackops_01"}
local farda_pf2 = {model = "s_m_y_cop_01"}
local farda_pf3 = {model = "f_momiji_18"}

for i=0,19 do
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}

  farda_pmerj_1[1] = {0,0}
  farda_pmerj_2[1] = {0,0}
  farda_bope_1[1] = {0,0}
  farda_bope_2[1] = {0,0}
  farda_unimed_1[1] = {0,0}
  farda_unimed_2[1] = {0,0}
  farda_unimed_3[1] = {0,0}
  farda_feminina_unimed_1[1] = {0,0}
  farda_pf[1] = {0,0}
  farda_pf1[1] = {0,0}
end


surgery_male[2] = {2,4} -- hair / texture
surgery_male[3] = {0,0} -- upper body gloves / texture
surgery_male[4] = {0,15} -- leg / texture
surgery_male[5] = {0,0} -- parachute
surgery_male[6] = {5,0} -- shoes
surgery_male[8] = {57,0} -- undershit - camiseta / texture
surgery_male[11] = {97,0} -- tops - jaqueta / texture

-- Female Initial
surgery_female[0] = {33,0} -- hair / texture
surgery_female[2] = {4,3} -- hair / texture
surgery_female[3] = {0,0} -- upper body gloves / texture
surgery_female[4] = {31,0} -- leg / texture
surgery_female[5] = {0,0} -- parachute
surgery_female[6] = {5,0} -- shoes
surgery_female[8] = {6,0} -- undershit - camiseta / texture
surgery_female[11] = {49,0} -- tops - jaqueta / texture

cfg.defaultMale = surgery_male
cfg.defaultFemale = surgery_female
-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["PMERJ"] = {
    _config = { permissions = {"pmerj.roupa"} },
  ["PMERJ 1"] = farda_pmerj_1,
  ["PMERJ 2"] = farda_pmerj_2
  },
  ["BOPE"] = {
    _config = { permissions = {"bope.roupa"} },
  ["BOPE 1"] = farda_bope_1,
  ["BOPE 2"] = farda_bope_2
  },
  ["UNIMED"] = {
    _config = { permissions = {"unimed.roupa"} },
    ["Unimed Doutor"] = farda_unimed_1,
    ["Unimed Medico"] = farda_unimed_2,
    ["Unimed Paramedico"] = farda_unimed_3,
    ["Unimed Feminino"] = farda_feminina_unimed_1
  },
  ["FEDERAL"] = {
    _config = { permissions = {"pf.roupa"} },
  ["Farda PF1"] = farda_pf,
  ["Farda PF2"] = farda_pf1,
  ["Farda PF3"] = farda_pf3,
  },
  ["Escolher Sexo"] = {
    _config = { not_uniform = true},
    ["Masculino"] = surgery_male,
    ["Feminino"] = surgery_female
  }
}

cfg.cloakrooms = {
  {"BOPE",455.61752319336,-991.18334960938,30.689586639404},
  {"PMERJ",455.61752319336,-991.18334960938,30.689586639404},
  {"UNIMED",341.97036743164,-580.04803466797,43.315002441406},
  {"FEDERAL",455.61752319336,-991.18334960938,30.689586639404},
  {"Escolher Sexo",232.03330993652,-397.39721679688,47.924354553223}
}

return cfg