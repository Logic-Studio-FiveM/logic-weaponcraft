local webhookQueue = {}
local isProcessingWebhooks = false

--- Queue a webhook to be sent
--- @param webhook string: The webhook URL
--- @param color number: The color of the embed
--- @param title string: The title of the embed
--- @param message string: The message of the embed
--- @param footer string: The footer of the embed
function queueWebhook(webhook, color, title, message, footer)
    webhookQueue[#webhookQueue+1] = {
        webhook = webhook,
        color = color,
        title = title,
        message = message,
        footer = footer
    }

    if not isProcessingWebhooks then
        processWebhookQueue()
    end
end

--- Process the webhook queue
local function processWebhookQueue()
    isProcessingWebhooks = true
    Citizen.CreateThread(function()
        while #webhookQueue > 0 do
            local webhookData = table.remove(webhookQueue, 1)
            sendLog(webhookData.webhook, webhookData.color, webhookData.title, webhookData.message, webhookData.footer)
            Citizen.Wait(1000)
        end
        isProcessingWebhooks = false
    end)
end

--- Send a log to the webhook
--- @param webhook string: The webhook URL
--- @param color number: The color of the embed
--- @param title string: The title of the embed
--- @param message string: The message of the embed
--- @param footer string: The footer of the embed
local function sendLog(webhook, color, title, message, footer)    
    local embed = {
        {
            ['title'] = title,
            ['description'] = message,
            ['color'] = color,
            ["footer"] = {
                ["text"] = footer,
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), {['Content-Type'] = 'application/json'})
end