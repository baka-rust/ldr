
local graphics = {

    screen_height = love.graphics.getHeight(),
    screen_width = love.graphics.getWidth(),

    scale = 1,

    camera = {
        x = 0,
        y = 0
    },

    -- list of entities, ordered via y axis for a topdown view
    drawstack = {}

}

    function graphics:draw_entities()
        -- orders entities in drawstack by sort_entites, calls draw method on each
        -- TODO: include spacial seperation via space.lua
        table.sort(self.drawstack, self.sort_entities)
        for i, entity in ipairs(self.drawstack) do
            entity:draw()
        end
    end

    function graphics:translate_camera()
        -- applies the camera translation to the love window (sans scaling)
        -- invoked *inside* of a love.graphics.push() / love.graphics.pop() stackframe
        love.graphics.translate(-graphics.camera.x, -graphics.camera.y)
    end

    function graphics:translate_scale()
        -- applies the scale translation to the love window
        -- invoked *inside* of a love.graphics.push() / love.graphics.pop() stackframe
        love.graphics.scale(scale, scale)
    end

    function graphics:set_nearest_neighbor(resources)
        -- sets all passed resoruces (list) to nearest neighbor scaling
        for i, resource in pairs(resources) do
            resource:setFilter("nearest", "nearest")
        end
    end


    function graphics:sort_entities(a, b)
        -- method for table.sort assumes y-axis sorting w/ a sort_offset per entity
        return (a.y - b.sort_offset) < (b.y - a.sort_offset)
    end

return graphics
