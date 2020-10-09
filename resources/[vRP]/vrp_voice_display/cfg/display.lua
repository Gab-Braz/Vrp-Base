-- Tecla para usar, PAGE UP

cfg = {
  { -- Distancia de voz (Perto)
    distance = 4.001,
    text = "", 
    css = [[
      .div_voice_back{
	      height: 30px;
        width: 30px;
        border-radius: 1000px;
        border: 3px solid rgba(0,90,0,0.9);
        background: rgba(0,160,0,0.9);
        top: 33%;
        right: 20px;
        position: absolute;
        z-index: 0;
      }
	    .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/zjaZNeR.png);
        height: 24px;
        width: 23px;
	      top: 33.7%;
        right: 26.7px;
        z-index: 1;
      }
    ]]
  },
  { -- Distancia de voz (Normal)
    distance = 8.001,
    text = "",
    css = [[
      .div_voice_back{
	      height: 30px;
        width: 30px;
        border-radius: 1000px;
        border: 3px solid rgba(255,40,0,0.9);
        background: rgba(255,120,0,0.9);
        top: 33%;
        right: 20px;
        position: absolute;
        z-index: 0;
      }
	    .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/zjaZNeR.png);
        height: 24px;
        width: 23px;
	      top: 33.7%;
        right: 26.7px;
        z-index: 1;
      }
    ]]
  },
  { -- Distancia de voz (Longe)
    distance = 16.001,
    text = "",
    css = [[
      .div_voice_back{
	      height: 30px;
        width: 30px;
        border-radius: 1000px;
        border: 3px solid rgba(90,0,0,0.9);
        background: rgba(160,0,0,0.9);
        top: 33%;
        right: 20px;
        position: absolute;
        z-index: 0;
      }
	    .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/zjaZNeR.png);
        height: 24px;
        width: 23px;
	      top: 33.7%;
        right: 26.7px;
        z-index: 1;
      }
    ]]
  }
}

return cfg