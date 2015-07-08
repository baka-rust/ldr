
local utility = {}

function utility:string_to_bool(str)
    -- converts a string to a boolean
    if str == "true" or str == "True" then
        return true
    else
        return false
    end
end

function utility:split_string(str, sep)
    -- splits a string (str) by a seperator (sep)
    local result = {}
    local i = 1
    for match in str:gmatch("([^"..sep.."]*)") do
        result[i] = result[i] or match
        if match == "" then
            i = i + 1
        end
    end
    return result
end

function utility:print_table(tab)
    -- prints a table (keys and values)
    for key, obj in pairs(tab) do
        print(key, obj)
    end
end

return utility
