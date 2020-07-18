-- imports
local constants = require './constants'
local Background = require './Entities/Background'
local Ground = require './Entities/Ground'
local Bird = require './Entities/Bird'
local Pipe = require './Entities/Pipe'

local background = Background:new()
local ground = Ground:new()
local Pipe = Pipe:new()
local bird = Bird:new()

function love.load()
    -- Init screen
    love.window.setMode(constants.WINDOW_WIDTH, constants.WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
    love.window.setTitle('Flapper Bird')

    -- Set Filter to nearest, to remove blur when scaling images
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.keyboard.setKeyRepeat(false)

    background:init('Assets/background.png', 30)
    ground:init('Assets/ground.png', 120, 0, love.graphics.getHeight())
    pipe:init()
    bird:init()
end

function love.update(dt)
    background:update(dt)
    ground:update(dt)
    pipe:update(dt)
    bird:update(dt)

    bird:collide(ground)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    background:draw()
    pipe:draw()
    ground:draw()
    bird:draw()
end
