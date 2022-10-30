-- Resource Metadata
fx_version 'adamant'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
-- dependencies { 'rdrp_core' } -- All resource dependencies
dependencies { 'rdrp_logs' }

-- Author Metadata
author 'NEO'
description 'RDRP | RDRP Admin script for all of your admin needs'
version 'v0.27'

-- Client Scripts
client_scripts { 'scripts/client/**.lua' }

-- Shared Scripts
shared_scripts { 'scripts/shared/**.lua' }

-- Server Scripts
server_scripts { 'scripts/server/**.lua' }

-- UI HTML page
ui_page 'ui/index.html'

-- Add all files used in the resource (excluding client / server scripts)
files {
    'ui/index.html',
    'ui/script.js',
    'ui/styles.css',
    'ui/assets/*.png',
    'ui/assets/lottie/logo.json'
}
