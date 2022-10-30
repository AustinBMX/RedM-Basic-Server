-- NUI callbacks

RegisterNUICallback('goto', function(data, cb)
    TriggerServerEvent('admin:getplayercoords', data.player)
    --data.staff = GetPlayerName(PlayerId())
    --TriggerServerEvent('rdrp_admin:goto', source, data, Config.Perms.Goto )
end)

RegisterNUICallback('bring', function(data, cb)
    coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('admin:teleportplayer', data.player,coords)
    --data.staff = GetPlayerName(PlayerId())
    --TriggerServerEvent('rdrp_admin:bring', source, data, Config.Perms.Bring )
end)


-- Net events for NUI callbacks

-- Bring player
RegisterNetEvent('admin:getplayercoords', function(admin)
    coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('admin:teleportadmin',admin, coords)
end)