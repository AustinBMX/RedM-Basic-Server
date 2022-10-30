RegisterServerEvent('rdrp_admin:allowAccess')
AddEventHandler('rdrp_admin:allowAccess', function(src, perms)
    print(perms)
    if checkPerms(source, perms) == true then
        print("Permission allowed")
        TriggerClientEvent('rdrp_admin:open', source)
    end
end)


RegisterServerEvent('rdrp_admin:goto')
AddEventHandler('rdrp_admin:goto', function(src, data, perms)  
print("goto test") 
    if checkPerms(src, perms) then
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(GetPlayerPed(data.player))
        SetEntityCoords(ped , coords)
        exports.rdrp_logs:console(data.staff.." teleported to "..player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff.." teleported to "..player(data.player), "admin", GetCurrentResourceName(), "/goto", {{["name"] = "Coords", ["value"] = jason.encode(coords)}})
    end
end)

RegisterServerEvent('rdrp_admin:bring')
AddEventHandler('rdrp_admin:bring', function(src, data, perms)
    if checkPerms(src, perms) then
        local ped = GetPlayerPed(data.player)
        local coords = GetEntityCoords(GetPlayerPed(src))
        SetEntityCoords(ped , coords)
        exports.rdrp_logs:console(data.staff.." teleported "..player(data.player).." to themself", GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff.." teleported "..player(data.player).." to themself", "admin", GetCurrentResourceName(), "/bring", {{["name"] = "Coords", ["value"] = jason.encode(coords)}})
    end
end)

RegisterServerEvent('rdrp_admin:warn')
AddEventHandler('rdrp_admin:warn', function(src, data, perms)   
    if checkPerms(src, perms) then
        print("!!!! WARNING !!!!")
        TriggerClientEvent('rdrp_admin:warn', data.player, data.data)
        exports.rdrp_logs:console(data.staff .. " warned " .. player(data.player) .. " with reason: " .. data.data, GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " warned " .. player(data.player), "admin", GetCurrentResourceName(), "/warn", {{["name"] = "Reason", ["value"] = data.data}})
    end
end)

RegisterServerEvent('rdrp_admin:slap')
AddEventHandler('rdrp_admin:slap', function(src, data, perms)   
    if checkPerms(src, perms) then
        TriggerClientEvent('rdrp_admin:slap', data.player)
        print(data.staff," slapping ", data.player)
        exports.rdrp_logs:console(data.staff .. " slapped " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " slapped " .. player(data.player), "admin", GetCurrentResourceName(), "/slap")
    end
end)

RegisterServerEvent('rdrp_admin:slay')
AddEventHandler('rdrp_admin:slay', function(src, data, perms)   
    if checkPerms(src, perms) then
        print(data.staff," Slay ", data.player)
        TriggerClientEvent('rdrp_admin:slay', data.player)
        exports.rdrp_logs:console(data.staff .. " slayed " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " slayed " .. player(data.player), "admin", GetCurrentResourceName(), "/slay")
    end
end)

RegisterServerEvent('rdrp_admin:spectate_start')
AddEventHandler('rdrp_admin:spectate_start', function(src, data, perms)
    if checkPerms(src, perms) then
        local _coords = GetEntityCoords(GetPlayerPed(data.player))
        SetEntityCoords(GetPlayerPed(src) ,_coords.x , _coords.y, _coords.z-50 )
        TriggerClientEvent('rdrp_admin:spectate_start', src, data)
        exports.rdrp_logs:console(data.staff .. " started to spectate " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " is now spectating " .. player(data.player), "admin", GetCurrentResourceName(), "/spectate")
    end
end)

local characters = {}
local players = {}
RegisterServerEvent('rdrp_admin:playerlist')
AddEventHandler('rdrp_admin:playerlist', function()
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        print(user.getName(), " opening Admin Menu")
    end)
    TriggerEvent("redem:getPlayers", function(curPlayers)
            players = {}
                for _, i in pairs(curPlayers) do
                        TriggerEvent('redemrp:getPlayerFromId', _, function(user)
                            if user ~= nil then
                                table.insert(players, {id = _, name = user.getName()})
                            end
                        end)
                end
    end)

    TriggerClientEvent('rdrp_admin:playerlist',source,players)
end)



function player(player)
    return "["..player.."]"..GetPlayerName(player)
end

-- Check if player has perm levels
function checkPerms(src, perms)
    local checkPerms = false
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        if perms == 0 and checkMod(user) then 
            checkPerms = true
        elseif perms == 1 then return checkAdmin(user) 
        elseif perms == 2 then return checkSenior(user)
        elseif perms == 3 then return checkManager(user)
        elseif perms == 4 then return checkSuper(user) end

    end)
    return checkPerms
end

function checkMod(user)
    if user.getGroup() == 'superadmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' or user.getGroup() == 'admin' or user.getGroup() == 'mod' and src ~= 0 then
        print(user.getGroup())
        return true
    end
    print('')
end

function checkAdmin(user)
    if user.getGroup() == 'superadmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' or user.getGroup() == 'admin' and src ~= 0 then
        return true
    end
end

function checkSenior(user)
    if user.getGroup() == 'superadmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' and src ~= 0 then
        return true
    end
end

function checkManager(user)
    if user.getGroup() == 'superadmin' or user.getGroup() == 'manager' and src ~= 0 then
        return true
    end
end

function checkSuper(user)
    if user.getGroup() == 'superadmin'and src ~= 0 then
        return true
    end
end


----------------------------------------------
-----------------------------------------------
----------------------------------------------
RegisterNetEvent("lightning-attacks:strike")

local function getPlayerId(nameOrId)
    local players = GetPlayers()

    for _, playerId in ipairs(players) do
        if playerId == nameOrId then
            return tonumber(playerId)
        end
    end

    nameOrId = string.lower(nameOrId)

    for _, playerId in ipairs(players) do
        if string.lower(GetPlayerName(playerId)) == nameOrId then
            return tonumber(playerId)
        end
    end
end

AddEventHandler("lightning-attacks:strike", function(targetPos)
    for _, player in ipairs(GetPlayers()) do
        if player == source then
            TriggerClientEvent("lightning-attacks:strike", player, targetPos, true)
        else
            TriggerClientEvent("lightning-attacks:strike", player, targetPos, false)
        end
    end
end)

--[[RegisterCommand("lightningattacks", function(source, args, raw)
    TriggerClientEvent("lightning-attacks:toggle", source)
end, false)

RegisterCommand("smite", function(source, args, raw)
    local id = getPlayerId(args[1])

    if id then
        TriggerClientEvent("lightning-attacks:smite", id)
    end
end, false)]]

RegisterServerEvent('rdrp_admin:smite')
AddEventHandler('rdrp_admin:smite', function(data)
     local id = data.player
     print("lightning-attacks",data.staff)
    if id then
        TriggerClientEvent("lightning-attacks:smite", id)
    end
end)


RegisterServerEvent('rdrp_admin:mod_help')
AddEventHandler('rdrp_admin:mod_help', function(msg)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local name = user.getName()
        TriggerEvent("redem:getPlayers", function(curPlayers)
            players = {}
                for _, i in pairs(curPlayers) do
                        TriggerEvent('redemrp:getPlayerFromId', _, function(user)
                            if user.getGroup() == "superadmin" then
                                TriggerClientEvent('chatMessage', _, "Mod Request", { 255, 255, 255 }, name.." is requesting a Mod at thier location for "..msg)
                            end
                        end)
                end
        end)
    end)
end)

RegisterCommand('d_vehicle', function(source,args, raw)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local group = user.getGroup()
        if group == 'superadmin' then 
            print("Delete", args[1])
            TriggerClientEvent('rdrp_admin:deleteveh',source,args[1])
            
        end
    end)
end, false)

RegisterCommand('ammo', function(source,args, raw)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local group = user.getGroup()
        if group == 'superadmin' then 
            TriggerClientEvent('rdrp_admin:ammo',source)
            
        end
    end)
end, false)

