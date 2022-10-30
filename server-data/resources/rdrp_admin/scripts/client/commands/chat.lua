
-- Direct message staff > player
RegisterNUICallback('directMessage', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('admin:directmessage', data)
end)

RegisterNetEvent("admin:directmessage")
AddEventHandler("admin:directmessage", function(data)
    TriggerEvent('chat:addMessage', {
            color = { 237, 81, 81 },
            multiline = true,
            args = {"Staff Direct Message", data.data}
        })
end)


RegisterCommand('modhelp', function()
        Citizen.CreateThread(function()
                AddTextEntry('FMMC_KEY_TIP8', "Are you currently STUCK somewhere?")
                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "TYPE: Yes or No", "", "", "", 20)
                while (UpdateOnscreenKeyboard() == 0) do
                        DisableAllControlActions(0)
                        Citizen.Wait(0)
                end
                if (GetOnscreenKeyboardResult()) == 'no' or (GetOnscreenKeyboardResult()) == 'NO' or (GetOnscreenKeyboardResult()) == 'No' or(GetOnscreenKeyboardResult()) == 'nO' then
                        Citizen.CreateThread(function()
                                AddTextEntry('FMMC_KEY_TIP8', "Is this question about general game mechanics?")
                                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "TYPE: Yes or No", "", "", "", 20)
                                while (UpdateOnscreenKeyboard() == 0) do
                                        DisableAllControlActions(0)
                                        Citizen.Wait(0)
                                end
                                if (GetOnscreenKeyboardResult()) == 'no' or (GetOnscreenKeyboardResult()) == 'NO' or (GetOnscreenKeyboardResult()) == 'No' or(GetOnscreenKeyboardResult()) == 'nO' then
                                        Citizen.CreateThread(function()
                                                AddTextEntry('FMMC_KEY_TIP8', "Do you have a Techical Support Issue or Question?")
                                                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "TYPE: Yes or No", "", "", "", 20)
                                                while (UpdateOnscreenKeyboard() == 0) do
                                                        DisableAllControlActions(0)
                                                        Citizen.Wait(0)
                                                end
                                                if (GetOnscreenKeyboardResult()) == 'no' or (GetOnscreenKeyboardResult()) == 'NO' or (GetOnscreenKeyboardResult()) == 'No' or(GetOnscreenKeyboardResult()) == 'nO' then
                                                        Citizen.CreateThread(function()
                                                                AddTextEntry('FMMC_KEY_TIP8', "Is this request for a player vs player report that is now over?")
                                                                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "TYPE: Yes or No", "", "", "", 20)
                                                                while (UpdateOnscreenKeyboard() == 0) do
                                                                        DisableAllControlActions(0)
                                                                        Citizen.Wait(0)
                                                                end
                                                                if (GetOnscreenKeyboardResult()) == 'no' or (GetOnscreenKeyboardResult()) == 'NO' or (GetOnscreenKeyboardResult()) == 'No' or(GetOnscreenKeyboardResult()) == 'nO' then
                                                                        Citizen.CreateThread(function()
                                                                                AddTextEntry('FMMC_KEY_TIP8', "Is this request for an IMMEDIATE need for a mod at your location?")
                                                                                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "TYPE: Yes or No", "", "", "", 20)
                                                                                while (UpdateOnscreenKeyboard() == 0) do
                                                                                        DisableAllControlActions(0)
                                                                                        Citizen.Wait(0)
                                                                                end
                                                                                if (GetOnscreenKeyboardResult()) == 'no' or (GetOnscreenKeyboardResult()) == 'NO' or (GetOnscreenKeyboardResult()) == 'No' or(GetOnscreenKeyboardResult()) == 'nO' then

                                                                                        TriggerEvent('redem_roleplay:NotifyLeft', "Mod Assistance", "Please only use this command to report immediate need for toxic behavior.", "mp_lobby_textures", "cross", tonumber(10000))
                                                                                        return

                                                                                else
                                                                                     Citizen.CreateThread(function()
                                                                                        AddTextEntry('FMMC_KEY_TIP8', "Please type a short detailed message for the Moderator Team.")
                                                                                        DisplayOnscreenKeyboard(0, "FMMC_KEY_TIP8", "", "", "", "", "", 50)
                                                                                        while (UpdateOnscreenKeyboard() == 0) do
                                                                                                DisableAllControlActions(0)
                                                                                                Citizen.Wait(0)
                                                                                        end
                                                                                        msg = GetOnscreenKeyboardResult()
                                                                                                TriggerServerEvent('rdrp_admin:mod_help', msg)
                                                                                                return
                                                                                     end)   
                                                                                end
                                                                        end)

                                                                else
                                                                        TriggerEvent('redem_roleplay:NotifyLeft', "Mod Assistance", "Please use Discord to put in a Moderator Ticket with a very detailed explanation and any screenshots or videos.", "mp_lobby_textures", "cross", tonumber(10000))
                                                                        return
                                                                end
                                                        end)

                                                else
                                                        TriggerEvent('redem_roleplay:NotifyLeft', "Mod Assistance", "Please use the Community and Discord for immediate help on Techical Support Questions. Put in a Ticket if this does not help.", "mp_lobby_textures", "cross", tonumber(10000))
                                                        return
                                                end
                                        end)

                                else
                                        TriggerEvent('redem_roleplay:NotifyLeft', "Mod Assistance", "Please use the Community and Discord for immediate help on gameplay questions. Also drb.gg has a lot of helpful guides.", "mp_lobby_textures", "cross", tonumber(10000))
                                        return
                                end
                        end)

                else
                        TriggerEvent('redem_roleplay:NotifyLeft', "Mod Assistance", "Please use /emergency to get unstuck from a room. Also /c may be used to get out of any animation.", "mp_lobby_textures", "cross", tonumber(10000))
                        return
                end
        end)
 end, false)       

-----------------------------------------------------------------
--- admin command hints
TriggerEvent('chat:addSuggestion', '/d_vehicle', '{ADMIN} - Delete a Vehicle.',{
        {name = "id", help = "Vehicle ID#"},
})
TriggerEvent("chat:addSuggestion", "/mod_help", "Request Admin HELP for an immediate player vs player issue. \nStandard troubleshooting should go through Discord. \nAbusing this function could result in a ban. ", {})
TriggerEvent("chat:addSuggestion", "/setjob", "{Admin} - Set Player Job.", {
        {name = "id", help = "Player ID#."},
        {name = "job", help = "Job to set"},
        {name = "level", help = "Job Level 1 - 10"},
    })
TriggerEvent("chat:addSuggestion", "/setmoney", "{Admin} - Set Player Money.", {
        {name = "id", help = "Player ID#."},
        {name = "amount", help = "Amount to set money too"},
    })
TriggerEvent("chat:addSuggestion", "/setmoney", "{Admin} - Set Player Money.", {
        {name = "id", help = "Player ID#."},
        {name = "amount", help = "Amount to set money too"},
    })
TriggerEvent("chat:addSuggestion", "/giveitem", "{Admin} - Give Player an inventory item.", {
        {name = "item", help = "Item Name"},
        {name = "amount", help = "Amount to give"},
    })
-----------------------------------------------------------------
--- Law command hints
TriggerEvent("chat:addSuggestion", "/confiscate", "{LAW} - Use to confiscate a wagon.", {
        {name = "id", help = "Wagon owner id - if unknown sit on wagon."}
    })
TriggerEvent("chat:addSuggestion", "/search_wagon", "{LAW} - Use to search a wagon while sitting on it.", {})

TriggerEvent("chat:addSuggestion", "/jail", "{LAW} - Use to send player to jail.", {
        {name = "id", help = "Player ID#."},
        {name = "time", help = "Time in Minutes - *Game Jail Days* "}
    })

TriggerEvent("chat:addSuggestion", "/add_wagon", "{LAW} - Use to add closest person to your Prison Wagon.", {})

TriggerEvent("chat:addSuggestion", "/take", "{LAW} - Use to attach or detach closest person to you.", {})

TriggerEvent("chat:addSuggestion", "/take_wagon", "{LAW} - Use to take a prisoner from your wagon.", {
        {name = "seat", help = "Player Position in Wagon 1 - 4"},
})

TriggerEvent("chat:addSuggestion", "/wear_prison", "{LAW} - Use to dress player in Prison Stipes.", {
        {name = "id", help = "Player ID#."},
})

TriggerEvent("chat:addSuggestion", "/unjail", "{LAW} - Use to release a player from jail.", {
        {name = "id", help = "Player ID#."},
})
-----------------------------------------------------------------
--- Doctor Command Hints
TriggerEvent("chat:addSuggestion", "/respond", "{DR} - Use to tell fellow doctors you are responding to a call.", {
        {name = "GO", help = "Type GO to hop to patient, leave blank to stay."},
})
-----------------------------------------------------------------
----Common Command Hints
TriggerEvent("chat:addSuggestion", "/givemoney", "Give another player money.", {
        {name = "id", help = "Player ID#."},
        {name = "amount", help = "Amount to give"},
})
TriggerEvent('chat:addSuggestion', '/playernames', 'Show/hide Player IDs')