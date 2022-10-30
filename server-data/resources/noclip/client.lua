local noclip = false
local noclip_speed = 0.5

RegisterCommand('noclip', function(source, args, user)
	local msg = "disabled"
	if(noclip == false)then
	    noclip_pos = GetEntityCoords(PlayerPedId(), false)
	end
	
	if(noclip)then
	    msg = "enabled"
	end
	TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Noclip has been ^2^*" .. msg)
    if noclip == true then
		SetEntityInvincible(PlayerPedId(), false)
		SetEntityVisible(PlayerPedId(), true, false)
		SetEntityCollision(PlayerPedId(), true)
  	end

  	noclip = not noclip 

end, false)

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