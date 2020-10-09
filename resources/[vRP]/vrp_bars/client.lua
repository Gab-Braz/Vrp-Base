vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP")
HUDserver = Tunnel.getInterface("vrp_bars", "vrp_bars")
vRPhud = {}
Tunnel.bindInterface("vrp_bars",vRPhud)

fome = 0
sede = 0



Citizen.CreateThread(function()
	while true do
	
	Citizen.Wait(1)
	        -- lateral-          top          --width --             height                rgba
		drawRct(0.1769,          0.861,        0.027,                0.011,            50,50,50,180) -- FUNDO PRETO VIDA

		drawRct(0.1769,          0.888,        0.027,                0.011,            50,50,50,180) -- FUNDO PRETO COLETE

		drawRct(0.1769,         0.915,        0.027,                0.011,            50,50,50,180) -- FUNDO PRETO FOME

		drawRct(0.1769,          0.942,       0.027,                0.011,            50,50,50,180) -- FUNDO PRETO SEDE

		painelNovo_txt(0.93, 0.5 ,1.0,1.0,0.6,"~r~RJ IMPERIO     ~w~0.5", 255,255,255,250, 4) -- Nome do Servidor



		--Vida
		local health = GetEntityHealth(GetPlayerPed(-1)) - 100
		--             Width		
		local varSet = 0.027 * (health / 100)	 
	--			left  -  top              Altura               RGBA
	drawRct(0.1769,       0.861,   varSet,  0.011,           55,115,55,255)

		--Colete
		armor = GetPedArmour(GetPlayerPed(-1))
		if armor > 100.0 then armor = 100.0 end
		local varSet = 0.027 * (armor / 100)			
		drawRct(0.1769,  0.888, varSet,0.011,            75,75,255,250)


        --Fome
		if fome > 100.0 then fome = 100.0 end
		local varSet = 0.027 * (fome / 100)			
        drawRct(0.1769, 0.915, varSet,0.011,        236,137, 10, 255)
        

		--Sede
		if sede > 100.0 then sede = 100.0 end
		local varSet = 0.027 * (sede / 100)		
		drawRct(0.1769,  0.942 , varSet,0.011,          50,153,204,250)   

	 end
	end)


function vRPhud.setHunger(hunger)
	fome = hunger
end

function vRPhud.setThirst(thirst)
	sede = thirst
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

function painelNovo_txt(x,y ,width,height,scale, text, r,g,b,a, font)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextCentre(center)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end


Citizen.CreateThread(function()
	Citizen.Wait(1)
	local playerPed = GetPlayerPed(-1)
	css = [[
.div_gps{
position: absolute;
content: url(https://cdn.discordapp.com/attachments/507302427754758144/547553911121379363/HUD_VENDA_1.png);
width: 20.5%;
height: 35.8%;
top: 71%;
left: 0.8%;
z-index: -4;
}
]]
  SetTimeout(6000, function()
	vRP.setDiv({"gps",css})
  end)
end)

-- Fixar erro de imagem não aparece

-- restart vrp_bars
-- restart vrp_job_display


-- stop watermarker


-- Funções Amorim

-- Remover HUDS do gta5 desnecessárias
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(2)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(13)
        HideHudComponentThisFrame(17)
        HideHudComponentThisFrame(20)
    end
end)