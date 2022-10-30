-- Resource Metadata
fx_version 'adamant'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
-- dependencies { 'rdrp_core', 'rdrp_bot' }

-- Author Metadata
author 'NEO'
description 'RDRP | RDRP Loggin script to help format and manage all logging events'
version 'v0.1'


-- Server Scripts
server_scripts { 'scripts/server/**.lua' }

-- Client exports
client_exports { 'console', 'discord'}

-- Server exports
server_exports {'console', 'discord'}


-- Add all files used in the resource (excluding client / server scripts)
files {

}
