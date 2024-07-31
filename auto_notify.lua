Config = {}

-- ASCII Art for Custom Code
Config.CustomCodeArt = [[
   ___              _                        ___             _             
  / __\ _   _  ___ | |_   ___   _ __ ___    / __\  ___    __| |  ___ __  __
 / /   | | | |/ __|| __| / _ \ | '_ ` _ \  / /    / _ \  / _` | / _ \\ \/ /
/ /___ | |_| |\__ \| |_ | (_) || | | | | |/ /___ | (_) || (_| ||  __/ >  < 
\____/  \__,_||___/ \__| \___/ |_| |_| |_|\____/  \___/  \__,_| \___|/_/\_\
]]

-- Function to Print the Custom Code Art
function printCustomCodeArt()
    print(Config.CustomCodeArt)
end

-- Call the function to display the ASCII art
printCustomCodeArt()

-- Display GitHub Link
print("Visit us at: https://github.com/CustomCodex")


-- Load the configuration file
local configFileContent = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
if configFileContent then
    local func, err = load(configFileContent)
    if func then
        func() -- Execute the configuration file to set up the Config table
    else
        print("Error loading config.lua: " .. err)
        return
    end
else
    print("Error: config.lua not found.")
    return
end

local currentMessageIndex = 1

-- Function to send notifications to all players
local function sendNotificationToPlayers()
    -- Loop through all connected players
    for _, playerId in ipairs(GetPlayers()) do
        -- Trigger the notification for each player
        TriggerClientEvent('esx:showNotification', playerId, Config.Messages[currentMessageIndex])
    end

    -- Log message to webhook
    local message = Config.Messages[currentMessageIndex]
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local logMessage = string.format("**Message Sent**\n**Time:** %s\n**Message:** %s", timestamp, message)
    
    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) 
        if err then
            print("Error sending webhook: " .. err)
        end
    end, 'POST', json.encode({
        content = logMessage
    }), { ['Content-Type'] = 'application/json' })

    -- Update the index for the next message
    currentMessageIndex = currentMessageIndex % #Config.Messages + 1
end

-- Create a loop that sends notifications every interval
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.NotificationInterval) -- Wait for the specified interval
        sendNotificationToPlayers()              -- Send the notification
    end
end)




