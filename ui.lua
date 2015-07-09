-- ui.lua
-- provides a high-level interface for a modular ui system

local class = require "middleclass"
local utility = require "utility"

local ui = {}

    ui.state = nil
    ui.state_stack = {}

    ui.states = utility:Set {
        "main-menu",
        "play",
        "game-menu",
        "pause"
    }

    function ui:set_state(state)
        if self.states[state] then
            self.state = state
        else
            error("State " .. state .. " not found in ui state list.")
        end
    end

    function ui:push_state(state)
        if self.states[state] then
            table.insert(self.state_stack, state)
            self.state = state
        else
            error("State " .. state .. " not found in ui state list.")
        end
    end

    function ui:pop_state()
        if #self.state_stack > 1 then
            table.remove(self.state_stack)
            self.state = self.state_stack[#self.state_stack]
        else
            error("Must be at least one state on the state_stack.")
        end
    end

    ui.Element = class('Element')

        function ui.Element:initialize()
        end




ui.state = ui.State:new("main-menu")

return ui
