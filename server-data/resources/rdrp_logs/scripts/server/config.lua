Config = {

    -- Make sure to add 'set RDRP_debugMode true' in your cfg file to enable debug mode
    Debug           = (GetConvar("rdrp_debug", "false") == "true" and true or false),

    ServerName      = "RDRP",
    ServerLogoURL   = "https://pixelperfect.gg/uploads/avatars/pixelperfect.png",

    Colour = {
        Misc        = "61ffff",
        Chat        = "45b8c2",
        Join        = "5cff58",
        Leave       = "fa3e58",
        Death       = "942020",
        Admin       = "8565d6",
    },

    Webhooks = {
        Misc        = "DISCORD_WEBHOOK_URN",   
        Chat        = "DISCORD_WEBHOOK_URN",
        Join        = "DISCORD_WEBHOOK_URN",
        Leave       = "DISCORD_WEBHOOK_URN",
        Death       = "DISCORD_WEBHOOK_URN",
        Admin       = "DISCORD_WEBHOOK_URN",
    },

}