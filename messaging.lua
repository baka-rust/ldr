-- messaging.lua
-- provies a basic pub-sub system for lua applications

local messaging = {
    channels = {}
}

function messaging.register(self, channel)
    if self.channels[channel] == nil then
        self.channels[channel] = {}
    end
end

function messaging.subscribe(self, channel, callback)
    table.insert(self.channels[channel], callback)
end

function messaging.publish(self, channel, message)
    for i, value in ipairs(self.channels[channel]) do
        value(message)
    end
end

return messaging
