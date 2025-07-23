Config = {}

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
