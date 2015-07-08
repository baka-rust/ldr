
local class = require "middleclass"
local utility = require "utility"

local spacial = {}


local Grid = class('Grid')
spacial.Grid = Grid

function Grid:initialize(chunk_size, max_entry_size)
    -- Constructor, creates a new Grid object
    self.max_entry_size = max_entry_size
    self.chunks = {} -- table of sub_grid entries, indexed by str representing square coordinates
end

return spacial
