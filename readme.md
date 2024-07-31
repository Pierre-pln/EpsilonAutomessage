# FiveM Auto Notify

Welcome to the FiveM Auto Notify resource! This script automatically displays periodic notifications to players on your server with interactive feedback options. Players can react to notifications with a "dumpsDown" reaction, which is logged to a Discord webhook. 

## Features

- Periodic notifications to players
- Interactive feedback with "dumpsDown" reaction
- Notifications can be frozen/unfrozen with a key press
- Daily reset for feedback counts
- Multilingual support: English, Dutch, French, German
- Customizable messages and notification intervals
- Webhook integration for logging reactions

## Installation

1. **Download and Extract**: Download the resource and extract the contents into your FiveM resources folder.

2. **Add to `server.cfg`**: Add the following line to your `server.cfg` to ensure the resource starts with your server:

    ```plaintext
    start Codex-Message
    ```

## Configuration

### `auto_notify/config.lua`

This file contains configuration settings for the Auto Notify resource.

```lua
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

-- Define the messages to be shown to players (multilingual support)
Config.Messages = {
    ['en'] = {
        "Welcome to [Your Server Name]! Dive into the action and enjoy your time!",
        "Respect fellow players and immerse yourself in the roleplay experience.",
        "Join our Discord community for server updates and to connect with other players: [Discord Link].",
        "Need help or want to report a player? Use /report to let us know.",
        "Explore new roles and adventures! Our server offers a wide range of experiences.",
        "Looking for roleplay tips? Check out our website for guides and tutorials.",
        "Join us for weekly events and special activities. Stay tuned for announcements!",
        "Remember to follow the server rules and guidelines. We aim for a fun and fair environment.",
        "Have suggestions or feedback? Share them with us on our forums: [Forums Link].",
        "Thank you for playing on [Your Server Name]. We appreciate your support and enthusiasm!"
    },
    ['nl'] = {
        "Welkom op [Jouw Servernaam]! Duik in de actie en geniet van je tijd!",
        "Respecteer medespelers en duik in de rolervaring.",
        "Word lid van onze Discord-community voor serverupdates en om contact te maken met andere spelers: [Discord Link].",
        "Hulp nodig of een speler willen rapporteren? Gebruik /report om het ons te laten weten.",
        "Ontdek nieuwe rollen en avonturen! Onze server biedt een breed scala aan ervaringen.",
        "Op zoek naar rolplay-tips? Bekijk onze website voor gidsen en tutorials.",
        "Doe mee met wekelijkse evenementen en speciale activiteiten. Blijf op de hoogte van aankondigingen!",
        "Vergeet niet de serverregels en richtlijnen te volgen. We streven naar een leuke en eerlijke omgeving.",
        "Heb je suggesties of feedback? Deel ze met ons op onze forums: [Forums Link].",
        "Bedankt voor het spelen op [Jouw Servernaam]. We waarderen je steun en enthousiasme!"
    },
    ['fr'] = {
        "Bienvenue sur [Nom de votre serveur] ! Plongez dans l'action et profitez de votre temps !",
        "Respectez les autres joueurs et immergez-vous dans l'expérience de jeu de rôle.",
        "Rejoignez notre communauté Discord pour les mises à jour du serveur et pour vous connecter avec d'autres joueurs : [Discord Link].",
        "Besoin d'aide ou de signaler un joueur ? Utilisez /report pour nous le faire savoir.",
        "Explorez de nouveaux rôles et aventures ! Notre serveur offre une large gamme d'expériences.",
        "Vous cherchez des conseils sur le jeu de rôle ? Consultez notre site pour des guides et des tutoriels.",
        "Rejoignez-nous pour des événements hebdomadaires et des activités spéciales. Restez à l'écoute des annonces !",
        "N'oubliez pas de suivre les règles et les directives du serveur. Nous visons un environnement amusant et équitable.",
        "Vous avez des suggestions ou des retours ? Partagez-les avec nous sur nos forums : [Forums Link].",
        "Merci de jouer sur [Nom de votre serveur]. Nous apprécions votre soutien et votre enthousiasme !"
    },
    ['de'] = {
        "Willkommen auf [Dein Servername]! Tauche in die Action ein und genieße deine Zeit!",
        "Respektiere andere Spieler und vertiefe dich in das Rollenspielerlebnis.",
        "Tritt unserer Discord-Community bei, um Server-Updates zu erhalten und dich mit anderen Spielern zu verbinden: [Discord Link].",
        "Benötigst du Hilfe oder möchtest einen Spieler melden? Nutze /report, um uns Bescheid zu geben.",
        "Entdecke neue Rollen und Abenteuer! Unser Server bietet eine Vielzahl von Erlebnissen.",
        "Suchst du nach Rollenspiel-Tipps? Schau dir unsere Website für Anleitungen und Tutorials an.",
        "Mach bei unseren wöchentlichen Events und besonderen Aktivitäten mit. Bleib dran für Ankündigungen!",
        "Vergiss nicht, die Serverregeln und Richtlinien zu befolgen. Wir streben nach einer lustigen und fairen Umgebung.",
        "Hast du Vorschläge oder Feedback? Teile sie mit uns auf unseren Foren: [Forums Link].",
        "Danke, dass du auf [Dein Servername] spielst. Wir schätzen deine Unterstützung und Begeisterung!"
    }
}

-- Define the interval for showing messages (in minutes)
Config.NotificationIntervalMinutes = 5

-- Webhook URL for logging messages
Config.WebhookURL = 'https://discord.com/api/webhooks/your-webhook-url'

-- Validate the interval value
if Config.NotificationIntervalMinutes < 1 then
    error("NotificationIntervalMinutes must be at least 1 minute.")
end

-- Convert minutes to milliseconds
Config.NotificationInterval = Config.NotificationIntervalMinutes * 60 * 1000
Config.ResetInterval = 24 * 60 * 60 * 1000  -- 24 hours in milliseconds
