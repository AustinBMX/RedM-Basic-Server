-------------------------
-- Ghost Config
-------------------------

ghost = {
    status  = false,
    player  = PlayerPedId()
}


-------------------------
-- NUI Callback
-------------------------

RegisterNUICallback('ghost', function(data, cb)
    ghost.toggle()
    if Config.Ghost.CloseOnToggle then
        SendNUIMessage({type = "close"})
    end
end)


-------------------------
-- Ghost Functions
-------------------------

function ghost.toggle()
    ghost.status = not ghost.status
    SetEntityVisible(ghost.player, not ghost.status, false)
end