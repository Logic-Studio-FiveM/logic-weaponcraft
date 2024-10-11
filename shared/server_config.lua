--- Send a notification to a player
--- @param id number: The player id
--- @param title string: The title of the notification
--- @param message string: The message of the notification
--- @param type string: The type of the notification
function sendNotification(playerId, title, message, type)
    TriggerClientEvent('ox_lib:notify', playerId, {
        title = title,
        description = message,
        duration = 5000,
        type = type
    })
end