-- utility.lua
-- contains some basic but useful functions

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

    function utility:create_grid(width, height, default_entry)
        local grid = {}
        for i = 1, width do
            grid[i] = {}
            for j = 1, height do
                grid[i][j] = default_entry
            end
        end
        return grid
    end

    function utility:Set(list)
        local set = {}
        for i, obj in ipairs(list) do
            set[obj] = true
        end
        return set
    end

return utility
