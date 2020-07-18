local Background = require './Entities/Background'
local constants = require 'constants'

local Ground = Background:new()
-- Ground.__index = Ground

function Ground:init(path, scrollSpeed, x, y)
    self:setImage(path)
    self.scrollSpeed = scrollSpeed or 0
    self.x = x or 0
    self.y = y and (y - self.image:getHeight() * constants.SCALING_FACTOR) or 0
end

function Ground:setY(y)
    self.y = y - self.image:getHeight() * constants.SCALING_FACTOR
end

function Ground:new()
    ground = Background:new()
    setmetatable(ground, self)
    self.__index = self

    return ground
end

return Ground
