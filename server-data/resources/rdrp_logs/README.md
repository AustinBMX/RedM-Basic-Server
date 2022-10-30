
<h1 align="center">RDRP | Console & Discord Logs</h1>

> rdrp_logs is the default logging script for all rdrp scripts. 
> rdrp_logs will allow scripts like rdrp_admin send console logs and discord logs to a specified channel, whenever a moderation / admin action has been sent.

<p align="center"><img src="https://github.com/NeonOdyssey/RDRP/blob/main/banner.png?raw=true"></p>

## Dependencies

For the time being, this script does not have any dependencies. <br />
However, this may change in the future, so be sure to keep an eye on the dependencies.


## Installation

1. Head over to your resource folder and find / create a folder called `[RDRP]`
2. Download the github repo using git: (*make sure you open cmd in the `[RDRP]` folder*)
    
    ```bash
    git clone https://github.com/NeonOdyssey/rdrp_logs.git rdrp_logs
    ```

3. In your `server.cfg` or `rdrp.cfg` folder add the following:

    ```cfg
    ensure rdrp_logs 
    ```
    
## Usage/Examples

You can use rdrp_logs via the server or client side scripts. Todo this you will need to send one of the following commands:

#### Lua
```lua
-- Logging to the server console
exports.rdrp_logs:console(msg, resourceName, logType) 

-- Logging to discord
exports.rdrp_logs:discord(description, logType, resourceName, title, fields) 
```

### Console Log Params
```js
/**
 * @param   {string}    msg             Required! This will be what the console outputs as the main message
 * @param   {string}    resourceName    Required! (use GetCurrentResourceName() to get the resource name)
 * @param   {string}    logType         Adds a tag to the console log, if none selected no tag will be added;"debug" (only if debug is enabled), "info", "warn", "error"
 */
```

### Discord Log Params
```js
/**
 * @param   {string}    description     Required! This will be the body of the
 * @param   {string}    logType         Required! This will change where the log will be sent, check out the Config to configure.
 *                                      This will only accept lowercase string values.
 * @param   {string}    resourceName    Required! (use GetCurrentResourceName() to get the resource name)
 * @param   {string}    title           Required! 
 * @param   {string}    fields          Optional! Check discord documentation for embed fields. An example of 2 fields:
 *                                      {{["name"] = "Title of field", ["value"] = "some more text"}, {["name"] = "Title of field2", ["value"] = "even more text"}}} 
 */
```

## License


> ### GNU GENERAL PUBLIC LICENSE
> #### *Version 3, 29 June 2007*
> Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>    <br />
> Everyone is permitted to copy and distribute verbatim copies            <br />
> of this license document, but changing it is not allowed.               <br />

[Read more ...](https://github.com/NeonOdyssey/rdrp_logs/blob/master/LICENCE)

## Authors

- [@NeonOdyssey](https://www.github.com/NeonOdyssey)
