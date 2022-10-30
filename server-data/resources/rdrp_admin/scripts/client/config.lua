Config = {}

-------------------------
-- Delete vehicle config 
-------------------------
Config.Dv = {    
    CloseOnToggle   = false,     -- Choose to close the admin panel when toggling noclip
}


-------------------------
-- Noclip config 
-------------------------
Config.Noclip = {    
    CloseOnToggle   = true,     -- Choose to close the admin panel when toggling noclip
    Ghost           = true     -- Choose to go invisible when toggling noclip
}


-------------------------
-- Ghost config 
-------------------------
Config.Ghost = {
    CloseOnToggle   = false     -- Choose to close the admin panel when toggling visability
}

Config.Cooldown = 3000
Config.MaxDistance = 1000.0

-------------------------
-- Permissions config 
-------------------------
-- Staff list from highest perm level to lowest. 
-- Each perm enherits the perms from the staff below
-------------------------
-- 4 = superAdmin    (Founders)
-- 3 = manager  (Staff management / Community UpKeep)
-- 2 = senior   (Supervisor)
-- 1 = admin    (Player management)
-- 0 = mod      (Support staff)
-------------------------
Config.Perms = { 
    OpenMenu = 0,     -- Who can open the menu

    -- Chat
    Dm = 0,           -- Direct message players in chat
    Announce = 0,     -- Global announcement player will be able to see

    -- Tp
    Tp = 1,           -- Teleport to a specific player
    Tpm = 1,          -- Teleport to a marker set on map
    Bring = 1,        -- Bring a player to said admin
    Noclip = 1,       -- Noclip

    -- Players
    Ghost = 1,        -- Invisible
    Heal = 1,         -- Heal / Revive a player
    Spectate = 1,     -- Spectate a player

    -- World
    Dv = 1,           -- Delete vehicle from world
    ClearArea = 2,    -- Clear a specific area from props, entities, vehicle, peds ect

    -- Punishments
    Warn = 0,         -- Warn a player with a message that they have to acknowladge
    Chain = 1,        -- Freeze a player in place (really really slow and add prison cloathing)
    Slap = 1,         -- Slap a player for a set ammount of hp and knockback (may not add)
    Slay = 1,         -- Kill player on spot
    Kick = 1,         -- Kick player from server with message
    Ban = 1,          -- Ban player from server with message
    
    -- Setting players things
    Job = 1,          -- Set a players job
    Money = 3,        -- Add/Remove money from player
    Gold = 3,         -- Add/Remove gold from player
    StaffPerms = 3,   -- Change staff perms on players
    
}