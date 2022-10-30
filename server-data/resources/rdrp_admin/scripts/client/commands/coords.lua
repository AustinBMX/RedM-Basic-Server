-- Copy coords to clipboard
RegisterNUICallback('coords', function(data, cb)
    if TriggerServerEvent('rdrp_admin:allowAccess', 'mod') then
        
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local mnt = GetMount(ped)
        local entity = (veh == 0 and (mnt == 0 and ped or mnt) or veh)
        local _x, _y, _z = table.unpack(GetEntityCoords(entity))

        local clipboard = json.encode({ x = _x, y = _y, z = _z, heading = GetEntityHeading(entity) })
        print(clipboard)

        if not exports.clipboard:SettingClipboard() then
            exports.clipboard:SetClipboard(clipboard, function (err)
                print('SET CLIPBOARD SUCCESS?', not err)
            end) 
        end

    else
        cb({error = 'You don\'t have the perms todo that!'})
    end
end)

