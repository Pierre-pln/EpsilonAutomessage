Config = {}

-- Define the messages to be shown to players
Config.Messages = {
    "Welcome to Hutsakeee Roleplay! Dive into the action and enjoy your time!",
    "Respect fellow players and immerse yourself in the roleplay experience.",
    "Join our Discord community for server updates and to connect with other players: https://discord.gg/zAQzk4tp77.",
    "Need help or want to report a player? Use /report to let us know.",
    "Explore new roles and adventures! Our server offers a wide range of experiences.",
    "Looking for roleplay tips? Check out our website for guides and tutorials.",
    "Join us for weekly events and special activities. Stay tuned for announcements!",
    "Remember to follow the server rules and guidelines. We aim for a fun and fair environment.",
    "Have suggestions or feedback? Share them with us on our forums: [Forums Link].",
    "Thank you for playing on Hutsakeee Roleplay. We appreciate your support and enthusiasm!"
}

-- Interval for showing messages (in minutes)
Config.NotificationIntervalMinutes = 15 -- Set your interval here

-- Webhook URL for logging messages
Config.WebhookURL = ''

-- Validate the interval value
if Config.NotificationIntervalMinutes < 1 then
    error("NotificationIntervalMinutes must be at least 1 minute.")
end

-- Convert minutes to milliseconds
Config.NotificationInterval = Config.NotificationIntervalMinutes * 60 * 1000

