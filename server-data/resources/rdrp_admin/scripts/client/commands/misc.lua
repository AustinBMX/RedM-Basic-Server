RegisterNUICallback('heal', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
end)

RegisterNUICallback('spectate', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:spectate', source, data, Config.Perms.Spectate )
end)