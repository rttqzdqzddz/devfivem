RegisterCommand('hi', function()
    TriggerEvent('chat:addMessage', { args = { 'Client', 'Hello from the client!' } })
end, false)
