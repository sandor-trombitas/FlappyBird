local constants = require 'constants'

local Bird = {
    x = 0,
    y = 0,
    rotation = 0,
    velocity = 0,
    flapButton = 'return',
    flapped = false
}

function Bird:init(x, y)
    self.image = love.graphics.newImage('Assets/bird.png')
    print(self.image)
    self.x = x or (love.graphics.getWidth() / 2) - self.image:getWidth()
    self.y = y or love.graphics.getHeight() / 2 - self.image:getHeight()
end

function Bird:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, constants.SCALING_FACTOR)
end

function Bird:update(dt)
    if (love.keyboard.isDown(self.flapButton) and not self.flapped) then
        self.velocity = self.flapped and self.velocity or self.velocity - 3
        self.flapped = true
    end
    if (not love.keyboard.isDown(self.flapButton)) then
        self.flapped = false
    end

    if (self.velocity * dt < 1) then
        self.velocity = self.velocity + constants.GRAVITY * dt
    else
        self.velocity = 1
    end
    if ( self.velocity * dt < -1) then
        self.velocity = -1
    end

    self.y = self.y + self.velocity
end

function Bird:new()
    bird = {}
    setmetatable(bird, self)
    self.__index = self

    return bird
end


return Bird
