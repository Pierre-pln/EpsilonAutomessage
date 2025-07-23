Config = {}

-- Define the messages to be shown to players
Config.Messages = {
    "Amusez vous bien sur Epsilon City !",
    "Vous vous posez des questions sur le serveurs ? docs.epsilon-city.fr",
    "Qu'attends tu pour nous rejoindre sur discord ? .gg/epsilon-city",
    "Besoin d'aide ? Tu peux /report , venir en BDA ou ouvrir un ticket discord.",
    "Avez-vous exploré toutes les posibilités du RolePlay ?.",
    "Regarde sur discord si jamais il n'y a pas d'evenements en cours.",
    "Tu as des suggestions ? Tout se passe sur discord",
    "Tu veux nous rejoindre pour nous aider ? C'est sur discord.",
    "Merci de jouer sur Epsilon City, n'hésitez pas à en parler autour de vous!"
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

