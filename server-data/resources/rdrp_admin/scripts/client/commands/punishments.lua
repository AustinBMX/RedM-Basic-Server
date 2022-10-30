-- NUI callbacks

RegisterNUICallback('warn', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:warn', source, data, Config.Perms.Warn )

end)

RegisterNUICallback('chain', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    
end)

RegisterNUICallback('slap', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:slap', source, data, Config.Perms.Slap )
end)

RegisterNUICallback('slay', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:slay', source, data, Config.Perms.Slay )
end)

RegisterNUICallback('kick', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('wmenu:kick',data.player)
end)

RegisterNUICallback('ban', function(data, cb)
    data.staff = GetPlayerName(PlayerId())

end)


-- Net events for NUI callbacks

-- Warn player
RegisterNetEvent('rdrp_admin:warn', function(data)
    print("YOU HAVE BEEN WARNED")
    print("--------------------------------")
    print(data)
end)

-- Slap player
RegisterNetEvent('rdrp_admin:slap', function()
    local ped = GetPlayerPed(PlayerId())
    ApplyDamageToPed(ped, 10, false, true, true)
end)

-- Slay player
RegisterNetEvent('rdrp_admin:slay', function()
    local ped = GetPlayerPed(PlayerId())
    ApplyDamageToPed(ped, 500000, false, true, true)
end)


