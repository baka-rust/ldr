-- messaging.lua
-- provies a basic pub-sub system for lua applications

local messaging = {
    channels = {}
}

function messaging:register(channel)
    -- registers a new channel
    if self.channels[channel] == nil then
        self.channels[channel] = {}
    end
end

function messaging:subscribe(channel, callback)
    -- subscribes to a channel, callback will be invoked when a message is published to that channel
    table.insert(self.channels[channel], callback)
end

function messaging:publish(channel, message)
    -- publishes a message to a channel
    for i, value in ipairs(self.channels[channel]) do
        value(message)
    end
end

return messaging
