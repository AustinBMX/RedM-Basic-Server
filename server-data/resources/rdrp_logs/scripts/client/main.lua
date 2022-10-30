-----------------------
-- Console logging
-----------------------
function console(msg, resourceName, logType)
    TriggerServerEvent('log_console', msg, resourceName, logType)
end

-----------------------
-- Discord logging
-----------------------
function discord(description, logType, resourceName, title, fields)
    TriggerServerEvent('log_discord', description, logType, resourceName, title, fields)
end

