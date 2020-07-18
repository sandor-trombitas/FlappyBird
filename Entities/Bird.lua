local constants = require 'constants'
local states = {
    FLY = 'fly',
    COLLIDING = 'colliding'
}

local Bird = {
    x = 0,
    y = 0,
    rotation = 0,
    velocity = 0,
    flapButton = 'space',
    flapped = false,
    state = states.FLY
}

function Bird:init(x, y)
    self.image = love.graphics.newImage('Assets/bird.png')
    print(self.image)
    self.x = x or (love.graphics.getWidth() / 2) - self.image:getWidth()
    self.y = y or love.graphics.getHeight() / 2 - self.image:getHeight()
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Bird:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, constants.SCALING_FACTOR)
end

function Bird:update(dt)
    -- When Flapping, increase velocity
    if (love.keyboard.isDown(self.flapButton) and not self.flapped) then
        self.velocity = self.flapped and self.velocity or self.velocity - 650 * dt
        self.state = states.FLY
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

function Bird:collide(target)
    if (self.x > target.x + target.width * constants.SCALING_FACTOR or target.x > self.x + self.width * constants.SCALING_FACTOR) then
        return
    end

    if (self.y > target.y + target.height * constants.SCALING_FACTOR or target.y > self.y + self.height * constants.SCALING_FACTOR) then
        return
    end

    print('hitting')
    self.y = target.y - self.height * constants.SCALING_FACTOR
    self.velocity = 0
    self.state = states.COLLIDING
end

function Bird:new()
    bird = {}
    setmetatable(bird, self)
    self.__index = self

    return bird
end


return Bird
