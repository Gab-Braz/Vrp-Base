
local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 5000
cfg.open_bank = 20000

-- money display css
cfg.display_css = [[

@font-face {
  src: url("../poppins.ttf");
  font-family: poppins;
}


.money {
   position: absolute;
   top: 7%;
   right: 1%;
   font-family: poppins;
}
  .money span {
    padding: 7px;
        background-color: rgba(50, 50, 50,.7);
        border-bottom: 3.5px solid rgb(170,1, 1);
        border-radius: 3px;
        color: white;
        box-shadow: -1px 1px 2px rgb(170,1, 1);
        margin-bottom: 10px;
        font-family: poppins;
  }

  .bank {
   position: absolute;
   top: 12%;
   right: 1%;
   font-family: poppins;
}
  .bank span {
    padding: 7px;
        background-color: rgba(50, 50, 50,.7);
        border-bottom: 3.5px solid rgb(170,1, 1);
        border-radius: 3px;
        color: white;
        box-shadow: -1px 1px 2px rgb(170,1, 1);
        margin-bottom: 10px;
        font-family: poppins;
  }

]]

return cfg