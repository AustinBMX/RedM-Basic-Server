-----------------------
-- Console logging
-----------------------
function console(msg, resourceName, logType) 

    local _resource = ""
    if resourceName == nil then
        _resource = ""
    else 
        _resource = "\27[0;36m [".. resourceName .."]"
    end

    local _msg = "\27[1m[\27[31mRD\27[97m.RP]\27[0m"

    if logType == "debug" and Config.Debug then
        _msg = _msg .. " \27[30;43m DEBUG " .. _resource .. "\27[0m "
    elseif logType == "info" then
        _msg = _msg .. " \27[37;44m INFO  " .. _resource .. "\27[0m "
    elseif logType == "warn" then
        _msg = _msg .. " \27[37;41m WARN  " .. _resource .. "\27[0;31m "
    elseif logType == "error" then
        _msg = _msg .. " \27[30;101m ERROR " .. _resource .. "\27[0;91m "
    else
        _msg = _msg .. _resource .. "\27[0m "
    end

    print(_msg .. msg)

end



-----------------------
-- Discord logging
-----------------------
function discord(description, logType, resourceName, title, fields)

    local _webhookURN, _colour, _announce

    if logType == "chat" then
        _webhookURN = Config.Webhooks.Chat
        _colour = tonumber(Config.Colour.Chat, 16)
    elseif logType == "join" then
        _webhookURN = Config.Webhooks.Join
        _colour = tonumber(Config.Colour.Join, 16)
    elseif logType == "leave" then
        _webhookURN = Config.Webhooks.Leave
        _colour = tonumber(Config.Colour.Leave, 16)
    elseif logType == "death" then
        _webhookURN = Config.Webhooks.Death
        _colour = tonumber(Config.Colour.Death, 16)
    elseif logType == "admin" then
        _webhookURN = Config.Webhooks.Admin
        _colour = tonumber(Config.Colour.Admin, 16)
        title = "👮‍♂️ " .. title
    elseif logType == "announce" then
        _webhookURN = Config.Webhooks.Misc
        _colour = tonumber("ff00ff", 16)
        _announce = "@everyone"
        title = "📣 RDRP | " .. title
    else
        _webhookURN = Config.Webhooks.Misc
        _colour = tonumber(Config.Colour.Misc, 16)
    end

    _content = json.encode({
        ["embeds"] = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = _colour,
            ["fields"] = fields,
            ["footer"] = { ["text"] = "rdrp.pixelperfect.gg" },
        }},
        ["username"] = Config.ServerName .. " | " .. resourceName,
        ["avatar_url"] = Config.ServerLogoURL,
        ["content"] = _announce
    })

    PerformHttpRequest(_webhookURN, function(Error, Content, Head) end, 'POST', _content, {['Content-Type'] = 'application/json'})
end
