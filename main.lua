-- imports
local constants = require './constants'

local background
local ground

function love.load()
    -- Set Filter to nearest, to remove blur when scaling images
    love.graphics.setDefaultFilter('nearest', 'nearest')

    background = love.graphics.newImage('Assets/background.png')
    ground = love.graphics.newImage('Assets/ground.png')
    -- Init screen
    love.window.setMode(constants.WINDOW_WIDTH, constants.WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, 4, 4)
    love.graphics.draw(ground, 0, love.graphics.getHeight() - 128, 0, 4, 4)
end
