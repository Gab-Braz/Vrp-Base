
local cfg = {}

cfg.message_paycheck = "Você recebeu seu Salario: ~g~R$" 
cfg.message_bill = "Pagamento de Contas: ~r~R$" 
cfg.post = "." 

cfg.bank = true 

cfg.minutes_paycheck = 30
cfg.minutes_bill = 60 

cfg.paycheck_title_picture = "Banco do Brasil" 
cfg.paycheck_picture = "CHAR_BANK_MAZE" 
cfg.bill_title_picture = "Pagamento de Impostos" 
cfg.bill_picture = "CHAR_MP_MORS_MUTUAL" 


cfg.paycheck = { 
  ["comandantepm.paycheck"] = 14000,
  ["coronelpm.paycheck"] = 12000,
  ["tencoronelpm.paycheck"] = 11000,
  ["majorpm.paycheck"] = 9000,
  ["capitaopm.paycheck"] = 8000,
  ["1tenentepm.paycheck"] = 7500,
  ["2tenentepm.paycheck"] = 6000,
  ["subtenentepm.paycheck"] = 5500,
  ["1sargentopm.paycheck"] = 5000,
  ["2sargentopm.paycheck"] = 4500,
  ["3sargentopm.paycheck"] = 4000,
  ["cabopm.paycheck"] = 3000,
  ["soldadopm.paycheck"] = 2000,
  ["recrutapm.paycheck"] = 1000,
  ["comandantebope.paycheck"] = 15000,
  ["coronelbope.paycheck"] = 13000,
  ["tencoronelbope.paycheck"] = 12000,
  ["majorbope.paycheck"] = 10000,
  ["capitaobope.paycheck"] = 9000,
  ["1tenentebope.paycheck"] = 8500,
  ["2tenentebope.paycheck"] = 7000,
  ["subtenentebope.paycheck"] = 6500,
  ["1sargentobope.paycheck"] = 6000,
  ["2sargentobope.paycheck"] = 5500,
  ["3sargentobope.paycheck"] = 5000,
  ["cabobope.paycheck"] = 4000,
  ["soldadobope.paycheck"] = 3000,
  ["diretorunimed.paycheck"] = 14000,
  ["subdiretorunimed.paycheck"] = 12000,
  ["doutorunimed.paycheck"] = 10000,
  ["cirurgiaounimed.paycheck"] = 8000,
  ["medicounimed.paycheck"] = 7000,
  ["socorristaunimed.paycheck"] = 5000,
  ["enfermeirounimed.paycheck"] = 4000,
  ["paramedicounimed.paycheck"] = 3000,
  ["estagiariounimed.paycheck"] = 2000,
  ["mecanico.paycheck"] = 1000,
  ["taxi.paycheck"] = 1000,
  ["sedex.paycheck"] = 1000
}

cfg.bill = {
  ["imposto.bolado"] = 800
}


return cfg

