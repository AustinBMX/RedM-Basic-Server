
<h1 align="center">RDRP | Admin Script - Admin panel</h1>

> rdrp_admin is a one of a kind admin script for redm. With a clean professional UI admin panel you can micro manage your staff members and manage what each role can do.

<p align="center"><img src="https://github.com/NeonOdyssey/RDRP/blob/main/banner.png?raw=true"></p>

## Dependencies

Other scripts that are required for this script to run on your server:

- [rdrp_logs](https://github.com/NeonOdyssey/rdrp_logs) - *this is used for logging to console and dedicated discord channels via webhooks*

## Features

The list of staff roles that can be assigned to players:

- Super Admin   - *Highest role on the server*
- Manager       - *Players who manage the server and the community*
- Senior Admin  - *More experienced admins who have slightly more power*
- Admin         - *Player management*
- Moderators    - *Support staff*

Each permission can be adjusted in the config file located in `scripts/client/config.lua`

## Installation

1. Head over to your resource folder and find / create a folder called `[RDRP]`
2. Make sure that `rdrp_logs` is downloaded and in the `[RDRP]` folder
3. Download the github repo using git: (*make sure you open cmd in the `[RDRP]` folder*)
    
    ```bash
    git clone https://github.com/NeonOdyssey/rdrp_admin.git rdrp_admin
    ```

4. In your `server.cfg` or `rdrp.cfg` folder add the following:

    ```cfg
    ensure rdrp_logs 
    ensure rdrp_admin
    ```
    
## Usage/Examples

At the moment there are no functionalities that can be used outside of this script.


## License


> ### GNU GENERAL PUBLIC LICENSE
> #### *Version 3, 29 June 2007*
> Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>    <br />
> Everyone is permitted to copy and distribute verbatim copies            <br />
> of this license document, but changing it is not allowed.               <br />

[Read more ...](https://github.com/NeonOdyssey/rdrp_admin/blob/master/LICENCE)

## Authors

- [@NeonOdyssey](https://www.github.com/NeonOdyssey)
