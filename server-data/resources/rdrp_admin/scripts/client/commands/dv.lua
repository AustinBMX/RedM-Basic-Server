-- Delete vehicle
RegisterNUICallback('dv', function(data, cb)
        local _id       = PlayerPedId()
        local _horse    = GetMount(_id)
        local _coach    = GetVehiclePedIsIn(_id)

        if type(_horse) == "number" and _horse ~= 0 then -- Check if player is on horse then delete
            DeletePed(_horse)
            cb({ok = "Horse " .. _horse .. " deleted"})

        elseif type(_coach) == "number" and _coach ~= 0 then -- Check if player is on a coach then delete
            SetEntityAsMissionEntity(_coach, true, true)
            DeleteVehicle(_coach)
            cb({ok = "Coach " .. _coach .. " deleted"})

        else
            cb({error = 'You are not on a horse / coach'})
        end

        if Config.Dv.CloseOnToggle then
            SendNUIMessage({type = "close"})
        end

end)