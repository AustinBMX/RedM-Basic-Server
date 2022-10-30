keys = {
 -- ['G'] = 0x760A9C6F,
  --['S'] = 0xD27782E3,
  --['W'] = 0x8FD015D8,
  --['H'] = 0x24978A28,
  --['G'] = 0x5415BE48,
  ["DEL"] = 0x1F6D95E5, --changed to N
  --['E'] = 0xDFF812F9
}

-- Noclip Tool for quick Route Making

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

local noclip = false
local noclip_speed = 0.5
Citizen.CreateThread(function()
      while true do
        if (noclip) then
          local ped = PlayerPedId()
          local x,y,z = getPosition()
          local dx,dy,dz = getCamDirection()
          local speed = noclip_speed

          SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

          if IsControlPressed(0, 0x8FD015D8) then -- MOVE UP
            x = x+speed*dx
            y = y+speed*dy
            z = z+speed*dz
          end

          if IsControlPressed(0, 0xD27782E3) then -- MOVE DOWN
            x = x-speed*dx
            y = y-speed*dy
            z = z-speed*dz
          end

          if IsControlJustReleased(0, 0xE30CD707) then -- CHANGE SPEED
              if noclip_speed ~= 5 then
                  noclip_speed = noclip_speed+0.5
                  print(noclip_speed)
              else
                  noclip_speed = 0.5
                  print(noclip_speed)
              end
          end

          SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
          SetEntityInvincible(ped, true)
          SetEntityVisible(ped, false, false)
          SetEntityCollision(ped, false)
        end
        Wait(0)
      end
end)

RegisterCommand('noclip', function()
  TriggerEvent("frp_admin:noclip")
  TriggerEvent("frp_admin:fixnoclip")
end,false)


RegisterNetEvent("frp_admin:noclip")
AddEventHandler("frp_admin:noclip", function()
  local msg = "disabled"
  if(noclip == false)then
    noclip_pos = GetEntityCoords(PlayerPedId(), false)
  end
  noclip = not noclip
  if(noclip)then
    msg = "enabled"
  end
  TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Noclip has been ^2^*" .. msg)
end)

RegisterNetEvent("frp_admin:fixnoclip")
AddEventHandler("frp_admin:fixnoclip", function()
  if noclip == true then
    SetEntityInvincible(PlayerPedId(), false)
    SetEntityVisible(PlayerPedId(), true, false)
    SetEntityCollision(PlayerPedId(), true)
  end

end)
---



Citizen.CreateThread(function()

 WarMenu.CreateMenu('admin', 'Admin Menu')
 WarMenu.CreateSubMenu('players', 'admin', 'Players Online')
 WarMenu.CreateSubMenu('self', 'admin', 'Admin')
 WarMenu.CreateSubMenu('playeroptions', 'admin', 'Player Info')
 WarMenu.CreateSubMenu('TP', 'admin', 'Teleport')
 WarMenu.CreateSubMenu('noclip', 'admin', 'Noclip')
 WarMenu.SetSubTitle('admin', 'Simplified Admin Order')
  while true do
    Citizen.Wait(0)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    if WarMenu.IsMenuOpened('admin') then

        if WarMenu.MenuButton('Other Options', 'self') then end
          WarMenu.Display()
        elseif WarMenu.IsMenuOpened('noclip') then
          if WarMenu.Button('Adminnoclip activate/deactivate') then
            TriggerEvent('noclip:activate')
          end
          WarMenu.Display()
        elseif WarMenu.IsMenuOpened('players') then
            local players = GetPlayers()
            for _, i in ipairs(players) do
              if WarMenu.MenuButton("ID: [" .. GetPlayerServerId(i) .. "] " .. GetPlayerName(i), 'playeroptions') then
                selectedPlayer = i
              end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('playeroptions') then
          if WarMenu.Button("ID: [" .. GetPlayerServerId(selectedPlayer) .. "] " .. GetPlayerName(selectedPlayer)) then
          elseif WarMenu.Button("Teleported to Player") then
                TriggerEvent("redemrp_notification:start", 'Teleport on '   .. GetPlayerName(selectedPlayer) .. '', 5)
                TeleportToPlayer(selectedPlayer);
          elseif WarMenu.Button("Unbug Player (Animations)") then
                TriggerEvent("redemrp_notification:start", 'You resynchronized '  .. GetPlayerName(selectedPlayer) .. '', 5)
                CancelAnimsAll(selectedPlayer);
          elseif WarMenu.Button("Kick") then
                TriggerEvent("redemrp_notification:start", 'You have kicked '  .. GetPlayerName(selectedPlayer) .. '', 5)
                TriggerServerEvent('wmenu:kick', GetPlayerServerId(selectedPlayer));
          end
          WarMenu.Display()
        elseif WarMenu.IsMenuOpened('self') then
          if WarMenu.MenuButton('Teleporte', 'TP') then
          elseif WarMenu.MenuButton('Noclip', 'noclip') then
          elseif WarMenu.Button("Teleport to Waypoint") then
                TeleportToWaypoint()
          elseif WarMenu.Button("Infinite Ammunition") then
                InfAmmo = not InfAmmo
                SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
            elseif WarMenu.Button("Invincible") then
                Godmode = not Godmode
                ToggleGodmode(Godmode)

        end
            WarMenu.Display()          
      elseif WarMenu.IsMenuOpened('TP') then
            if WarMenu.Button('Armadillo') then
          SetEntityCoords(playerPed, -3622.04,-2612.9,-13.61) 
        elseif WarMenu.Button('Valentine') then
          SetEntityCoords(playerPed, -238.11,744.48,116.68) 
        elseif WarMenu.Button('Blackwater') then
          SetEntityCoords(playerPed, -908.72,-1366.0,45.41) 
        elseif WarMenu.Button('Strawberry') then
          SetEntityCoords(playerPed, -1781.67,-378.35,158.14) 
        elseif WarMenu.Button('Saint Deny') then
          SetEntityCoords(playerPed, 2415.1,-1164.2,46.29)
        elseif WarMenu.Button('Annesburg') then
          SetEntityCoords(playerPed, 2904.81,1356.38,51.72)
        elseif WarMenu.Button('VanHorn') then
          SetEntityCoords(playerPed, 2955.93,501.25,45.87)
        elseif WarMenu.Button('Tumbleweed') then
          SetEntityCoords(playerPed, -5519.9,-2901.19,-2.5)
        elseif WarMenu.Button('BacchusStation') then
          SetEntityCoords(playerPed, 572.85,1688.11,187.63)
        elseif WarMenu.Button('MountHagen') then
          SetEntityCoords(playerPed, -1917.85,1333.33,200.86)
        elseif WarMenu.Button('Rhodes') then
          SetEntityCoords(playerPed, 1299.68,-1330.98,77.5)
      end
      WarMenu.Display()
    end
  end
end)

RegisterNetEvent('bberry:menu')
AddEventHandler('bberry:menu', function()
  if not WarMenu.IsAnyMenuOpened() then
    WarMenu.OpenMenu('admin')
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if  IsControlJustPressed(0, 0x35957F6C)  then
      --TriggerServerEvent('bberry:checkgroup') 
      TriggerEvent('bberry:menu')
    end
  end
end)

local noclip = false
local noclip_speed = 5.0

function admin_no_clip()
noclip = not noclip
  local playerPed = PlayerPedId()
  if noclip then -- active
    TriggerEvent("redemrp_notification:start", 'Noclip Enabled.', 5)
    SetEntityInvincible(playerPed, true)
    SetEntityVisible(playerPed, false, false)
  
  else -- desactive
    TriggerEvent("redemrp_notification:start", 'Noclip Disabled.', 5)
    SetEntityInvincible(playerPed, false)
    SetEntityVisible(playerPed, true, false)
  
  end
end

function CancelAnimsAll(target)
    local plist = GetActivePlayers(target)
    for i = 0, #plist do
        if not self and i == PlayerId() then i = i + 1 end
        ClearPedTasksImmediately(GetPlayerPed(plist[i]))
    end
end

function GiveMaxAmmo(target)
    local ped = GetPlayerPed(target)
    for i = 1, #allweapons do
        AddAmmoToPed(ped, GetHashKey(allweapons[i]), 9999)
    end
end

function ToggleGodmode(tog)
    local ped = PlayerPedId()
  SetEntityProofs(ped, tog, tog, tog, tog, tog)
    SetPedCanRagdoll(ped, not tog)

end

function TeleportToPlayer(target)
    local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function TeleportToWaypoint()
    local ply = PlayerPedId()
    if DoesEntityExist(ply) then
        local WaypointV = GetWaypointCoords()

        for height = 1, 1000 do
            SetEntityCoords(ply, WaypointV.x, WaypointV.y, height + 0.0)

            local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(WaypointV.x, WaypointV.y, height + 0.0)
            if foundground then
                SetEntityCoords(ply, WaypointV.x, WaypointV.y, height + 0.0)
                break
            end
            Wait(25)
        end
    else
        print("kek you dont exist")
    end
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if noclip then
      local playerPed = PlayerPedId()
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed

      -- reset du velocity
      SetEntityVelocity(playerPed, 0.0001, 0.0001, 0.0001)

      -- aller vers le haut
      if IsControlPressed(0, keys['W']) then -- MOVE UP
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end

      -- aller vers le bas
      if IsControlPressed(0, keys['S']) then -- MOVE DOWN
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end
      SetEntityCoordsNoOffset(playerPed,x,y,z,true,true,true)
    end
  end
end)

RegisterNetEvent('noclip:activate')
AddEventHandler('noclip:activate', function()
  admin_no_clip()
end)