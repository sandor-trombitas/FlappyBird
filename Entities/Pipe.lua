local constants = require 'constants'

local Pipe = {
    x = 0,
    y = 0,
    rotation = 0,
    velocity = -120
}

function Pipe:init(x, y)
    self.image = love.graphics.newImage('Assets/pipe.png')

    print(self.image)
    self.x = x or (love.graphics.getWidth()) - self.image:getWidth()
    self.y = y or love.graphics.getHeight() - self.image:getHeight() * constants.SCALING_FACTOR
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Pipe:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, constants.SCALING_FACTOR)
end

function Pipe:update(dt)
    self.x = self.x + self.velocity * dt
end

function Pipe:new()
    pipe = {}
    setmetatable(pipe, self)
    self.__index = self

    return pipe
end


return Pipe
