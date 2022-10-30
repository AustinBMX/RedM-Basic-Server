Config = {}

-- Configurable controls
Config.ToggleControl        = `INPUT_PHOTO_MODE_PC`                     -- F6
Config.IncreaseSpeedControl = {`INPUT_CREATOR_LT`, `INPUT_PREV_WEAPON`} -- Page Up, Middle Wheel Up
Config.DecreaseSpeedControl = {`INPUT_CREATOR_RT`, `INPUT_NEXT_WEAPON`} -- Page Down, Middle Wheel Down
Config.UpControl            = `INPUT_JUMP`                              -- Spacebar
Config.DownControl          = `INPUT_SPRINT`                            -- Shift
Config.ForwardControl       = `INPUT_MOVE_UP_ONLY`                      -- W
Config.BackwardControl      = `INPUT_MOVE_DOWN_ONLY`                    -- S
Config.LeftControl          = `INPUT_MOVE_LEFT_ONLY`                    -- A
Config.RightControl         = `INPUT_MOVE_RIGHT_ONLY`                   -- D
Config.ToggleModeControl    = `INPUT_COVER`                             -- Q
Config.FollowCamControl     = `INPUT_MULTIPLAYER_PREDATOR_ABILITY`      -- H

-- Maximum speed
Config.MaxSpeed = 10.0

-- Minimum speed
Config.MinSpeed = 0.1

-- How much speed increases by when speed up/down controls are pressed
Config.SpeedIncrement = 0.1

-- Default speed
Config.Speed = 0.1

-- Whether to enable relative mode by default.
--
-- false: Movement is based on the cardinal directions.
-- 	W = North
-- 	S = South
-- 	A = East
-- 	D = West
--
-- true: Movement is based on the current heading.
-- 	W = forward
-- 	S = backwards
-- 	A = rotate left
-- 	D = rotate right
--
Config.RelativeMode = true

-- Whether to enable follow cam mode by default.
Config.FollowCam = false
