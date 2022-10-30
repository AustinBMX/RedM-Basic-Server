-------------------------
-- Noclip Config
-------------------------

Noclip = {
    -- Configpurable controls
    IncreaseSpeedControl	= `INPUT_MOVE_RIGHT_ONLY`,
    DecreaseSpeedControl	= `INPUT_MOVE_LEFT_ONLY`,
    UpControl           	= `INPUT_JUMP`,
    DownControl         	= `INPUT_SPRINT`,
    ForwardControl      	= `INPUT_MOVE_UP_ONLY`,
    BackwardControl     	= `INPUT_MOVE_DOWN_ONLY`,

    MaxSpeed        		= 10.0,     -- Maximum speed
    MinSpeed        		= 0.2,      -- Minimum speed
    SpeedIncrement  		= 0.2,      -- How much speed increases by when speed up/down controls are pressed
    Speed          			= 1.0,      -- Default speed
}


-------------------------
-- NUI Callback
-------------------------

RegisterNUICallback('noclip', function(data, cb)
    Toggle()
    if Config.Noclip.CloseOnToggle then
        SendNUIMessage({type = "close"})
    end
end)


-------------------------
-- Noclip Functions
-------------------------

local Enabled = false
local Speed = Noclip.Speed

-- Toggles noclip
function Toggle()
    Enabled = not Enabled
    local entity = GetNoClipTarget()

    SetEntityInvincible(PlayerPedId(), Enabled)
	ClearPedTasksImmediately(entity, false, false)
    FreezeEntityPosition(entity, Enabled)
	SetEntityHeading(entity, TranslateHeading(entity, GetEntityHeading(entity)))
    if Config.Noclip.Ghost then
        SetEntityVisible(PlayerPedId(), not Enabled, false)
    end
end

-- Return the player or their vehicle/mount if one exists
function GetNoClipTarget()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local mnt = GetMount(ped)
	return (veh == 0 and (mnt == 0 and ped or mnt) or veh)
end

-- Translate 180 degrees for peds, as their models face backwards
function TranslateHeading(entity, h)
	if GetEntityType(entity) == 1 then
		return (h + 180) % 360
	else
		return h
	end
end

-- Draw help text
function DrawText(text, x, y, centred)
	SetTextScale(0.35, 0.35)
	SetTextColor(255, 255, 255, 255)
	SetTextCentre(centred)
	SetTextDropshadow(1, 0, 0, 0, 200)
	SetTextFontForCurrentCommand(0)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

-- Load all config settings
function LoadSettings()
	local relativeMode = GetResourceKvpString('relativeMode')
	if relativeMode ~= nil then
		RelativeMode = relativeMode == 'true'
	end

	local followCam = GetResourceKvpString('followCam')
	if followCam ~= nil then
		FollowCam = followCam == 'true'
	end

	local speed = GetResourceKvpString('speed')
	if speed ~= nil then
		Speed = tonumber(speed)
	end
end

-- Set speed
function SetSpeed(value)
	Speed = value
	SetResourceKvp('speed', tostring(Speed))
end

-- Set controls
function CheckControls(func, pad, controls)
	if type(controls) == 'number' then
		return func(pad, controls)
	end

	for _, control in ipairs(controls) do
		if func(pad, control) then
			return true
		end
	end

	return false
end


-------------------------
-- Event Handlers
-------------------------

-- On resource stop stop noclip
AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName and Enabled then
		Toggle()
	end
end)


-------------------------
-- Main noclip function
-------------------------

CreateThread(function()
	LoadSettings()

	while true do
		Wait(0)

		if Enabled then

			DisableFirstPersonCamThisFrame()

			-- Get the entity we want to control in noclip mode
			local entity = GetNoClipTarget()

			FreezeEntityPosition(entity, true)

			-- Get the position and heading of the entity
			local x, y, z = table.unpack(GetEntityCoords(entity))
			local h = TranslateHeading(entity, GetEntityHeading(entity))

			-- Cap the speed between MinSpeed and MaxSpeed
			if Speed > Noclip.MaxSpeed then
				SetSpeed(Noclip.MaxSpeed)
			end
			if Speed < Noclip.MinSpeed then
				SetSpeed(Noclip.MinSpeed)
			end

			-- Print the current noclip speed on screen
			DrawText(string.format('NoClip Speed: %.1f', Speed), 0.5, 0.90, true)

			-- Increase/decrease speed
			if CheckControls(IsDisabledControlPressed, 0, Noclip.IncreaseSpeedControl) then
				SetSpeed(Speed + Noclip.SpeedIncrement)
			end
			if CheckControls(IsDisabledControlPressed, 0, Noclip.DecreaseSpeedControl) then
				SetSpeed(Speed - Noclip.SpeedIncrement)
			end

			-- Move up/down
			if CheckControls(IsDisabledControlPressed, 0, Noclip.UpControl) then
				z = z + Speed
			end
			if CheckControls(IsDisabledControlPressed, 0, Noclip.DownControl) then
				z = z - Speed
			end

            -- Print the coordinates, heading and controls on screen
			DrawText(string.format('Coordinates:\nX: %.2f\nY: %.2f\nZ: %.2f\nHeading: %.0f', x, y, z, h), 0.01, 0.3, false)

			DrawText('W/S - Move  |  Spacebar/Shift - Up/Down  |  A/D - Change speed', 0.5, 0.95, true)

			-- Calculate the change in x and y based on the speed and heading.
			local r = -h * math.pi / 180
			local dx = Speed * math.sin(r)
			local dy = Speed * math.cos(r)

			-- Move forward/backward
			if CheckControls(IsDisabledControlPressed, 0, Noclip.ForwardControl) then
				x = x + dx
				y = y + dy
			end
			if CheckControls(IsDisabledControlPressed, 0, Noclip.BackwardControl) then
				x = x - dx
				y = y - dy
			end

			-- Rotate heading
			local rot = GetGameplayCamRot(2)
			h = rot.z
			
			SetEntityCoordsNoOffset(entity, x, y, z)
			SetEntityHeading(entity, TranslateHeading(entity, h))
		end
	end

end)
