
local cfg = {}

cfg.message_paycheck = "Você recebeu seu Pagamento VIP: ~g~R$" 
cfg.message_bill = "" 
cfg.post = "." 

cfg.bank = true 

cfg.minutes_paycheck = 30
cfg.minutes_bill = 0 

cfg.paycheck_title_picture = "Salario VIP" 
cfg.paycheck_picture = "CHAR_TONY_PRINCE" 
cfg.bill_title_picture = "" 
cfg.bill_picture = "" 


cfg.paycheck = { 
  ["vip4.paycheck"] = 10000,
  ["vip3.paycheck"] = 8000,
  ["vip2.paycheck"] = 5000,
  ["vip1.paycheck"] = 5000
}

cfg.bill = {
}


return cfg

