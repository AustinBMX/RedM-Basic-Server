Keys = {
    Open = 0x35957F6C
}


Citizen.CreateThread(function() 
    -- Check if player is wanting to open the admin menu
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Keys.Open) then
            TriggerEvent('rdrp_admin:_open')
        end
    end
end)



-------------------------
-- NET EVENTS
-------------------------
local playerList = {}
-- open menu and send all players
RegisterNetEvent('rdrp_admin:_open', function() TriggerServerEvent('rdrp_admin:allowAccess', source, Config.Perms.OpenMenu ) end)

RegisterNetEvent('rdrp_admin:open', function(data)
    playerList = {}
    TriggerServerEvent('rdrp_admin:playerlist')
    Citizen.Wait(500)


    SetNuiFocus(true, true)
    SendNUIMessage({type = "open", players = playerList})
end)


-------------------------
-- NUI CALLBACKS
-------------------------

-- When menu closes remove focus
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
    cb({error = ''})
end)


-------------------------
-- FUNCTIONS
-------------------------

-- Get players close to player

-- Get all players in server
function getPlayersAll()
    local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            print(i)
            table.insert(players, {id = GetPlayerServerId(i), name = GetPlayerName(i)})
        end
    end
    return players
end

RegisterNetEvent("rdrp_admin:playerlist")
AddEventHandler("rdrp_admin:playerlist", function(players)
--print(players)
    playerList = players
end)

local ammo = false
RegisterNetEvent("rdrp_admin:ammo")
AddEventHandler("rdrp_admin:ammo", function()
SetPedInfiniteAmmoClip(PlayerPedId(), ammo)
ammo = not ammo
end)