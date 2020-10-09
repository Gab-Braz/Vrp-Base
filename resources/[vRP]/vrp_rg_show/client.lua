-- Amorim#0567



RegisterNetEvent("abrir")
AddEventHandler("abrir", function(id,name,idade,rg,numero,emprego,vip,cnh,porte,dinheiro,banco,home,number)

    local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sex = true
            elseif not male then
                sex = 2
            end

    SendNUIMessage({
        type = "send",
        id = id,
        name = name,
        idade = idade,
        rg = rg,
        numero = numero,
        emprego = emprego,
        vip = vip,
        cnh = cnh,
        porte = porte,
        sex = sex,
        dinheiro = dinheiro,
        banco = banco,
        home = home,
        number = number,
        open = true
    })
end)


Citizen.CreateThread( function()
	while true do
        Citizen.Wait(1)
        --etNuiFocus(false, false)
        if IsControlJustPressed(1, 243) then --Start holding
            -- SendNUIMessage({
            --     open = true
            -- })
            TriggerServerEvent("updates")
		elseif IsControlJustReleased(1, 243) then --Stop holding
            SendNUIMessage({
                open = false
            })
		end
	end
end)