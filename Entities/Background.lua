local Background = {
    x = 0,
    y = 0,
    scrollSpeed = 0
}

Background.__index = Background

function Background:new()
    bg = {}
    setmetatable(bg, self)

    return bg
end

local constants = require '../constants'

function Background:init(path, scrollSpeed)
    self.scrollSpeed = scrollSpeed
    self:setImage(path)
end

function Background:setImage(path)
    self.image = love.graphics.newImage(path)
end

function Background:update(dt)
    self.x = self.x + -self.scrollSpeed * dt
    if self.x <= -((self.image:getWidth() / 2) * constants.SCALING_FACTOR) then
        self.x = 0
    end
end

function Background:reset()

end


function Background:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, constants.SCALING_FACTOR)
end

return Background
