-- spacial.lua
-- provides a spacial partitioning system + data structure

local class = require "middleclass"
local utility = require "utility"

local spacial = {}

    spacial.Grid = class('Grid')

        function spacial.Grid:initialize(chunk_size, max_entry_size)
            -- Constructor, creates a new Grid object
            self.max_entry_size = max_entry_size
            self.chunks = {} -- table of sub_grid entries, indexed by str representing square coordinates
        end

return spacial
