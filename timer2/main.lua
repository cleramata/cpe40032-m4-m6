--[[
    CMPE40032
    timer2

    Example used to showcase a simple way of implementing a timer that affects
    some output on the screen, but with the Timer class provided by the Knife
    library to make our lives a whole lot easier.
]]

push = require 'push'
Timer = require 'knife.timer'

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
function love.load()
    
    counter = 3
    doColor = true


    function increment()
        if counter > 1 then
        counter = counter - 1
        else
            counter = 3
        end
    end

    function color()
        doColor =  not doColor
    end

    Timer.every(1, increment)
    Timer.every(1, color)
    

    

    
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    -- perform the actual updates in the functions we passed in via Timer.every
    Timer.update(dt)
end

function love.draw()
    push:start()

    love.graphics.rectangle('line', 50,100,40,40)
    love.graphics.rectangle('line', 100,100,40,40)
    love.graphics.rectangle('line', 150,100,40,40)

    if counter == 1 then

    love.graphics.setColor(255,0,0,250)
    love.graphics.rectangle('fill', 50,100,40,40)

    elseif counter == 2 then
    love.graphics.setColor(0,255,0,250)
    love.graphics.rectangle('fill', 100,100,40,40)
    
    elseif counter == 3 then
    love.graphics.setColor(0,0,255,250)
    love.graphics.rectangle('fill', 150,100,40,40)
    end

    push:finish()
end