
local square = {}
square.size = 50
square.x = math.random(0, 800 - square.size)
square.y = math.random(0, 600 - square.size)
square.speed = 200

local score = 0
local time_remaining = 10
local game_over = false

function love.load()
    love.window.setTitle("Catch the Square")
    love.window.setMode(800, 600)
end

function love.update(dt)
    if game_over then
        return
    end

    time_remaining = time_remaining - dt

    if time_remaining <= 0 then
        game_over = true
    end
end

function love.draw()
    if game_over then
        love.graphics.printf("Game Over! Final Score: " .. score, 0, 250, 800, "center")
    else
        love.graphics.setColor(1, 0, 0) -- Red color
        love.graphics.rectangle("fill", square.x, square.y, square.size, square.size)
        love.graphics.setColor(1, 1, 1) -- White color
        love.graphics.print("Score: " .. score, 10, 10)
        love.graphics.print("Time: " .. math.ceil(time_remaining), 700, 10)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 and not game_over then
        if x >= square.x and x <= square.x + square.size and y >= square.y and y <= square.y + square.size then
            score = score + 1
            square.x = math.random(0, 800 - square.size)
            square.y = math.random(0, 600 - square.size)
            square.speed = square.speed + 50
        end
    end
end
