package.path = "../?.lua;" .. package.path
local messaging = require("messaging")

function callback_test(message)
    print("callback envoked with " .. message)
end

function callback_test_2(message)
    print("callback 2 envoked with " .. message)
end

function test()
    messaging:register("test")
    messaging:subscribe("test", callback_test)
    messaging:subscribe("test", callback_test_2)
    messaging:publish("test", "test message")
end

test()
