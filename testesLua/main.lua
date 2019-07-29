-- Load some default values for our rectangle.
function love.load()
    bastao1 = {}
    bastao1.x = 20
    bastao1.y = (love.graphics.getHeight()/2)-30
    bastao1.w = 30
    bastao1.h = 60

    bastao2 = {}
    bastao2.x = love.graphics.getWidth() - 50
    bastao2.y = (love.graphics.getHeight()/2)-30
    bastao2.w = 30
    bastao2.h = 60

    bola = {}
    bola.x = love.graphics.getWidth()/2
    bola.y = love.graphics.getHeight()/2
    bola.rx = 20
    bola.ry = 20
end
 
-- Increase the size of the rectangle every frame.
function love.update(dt)
    
    if love.keyboard.isDown("q") and bastao1.y > 10 then
        bastao1.y=bastao1.y-5
    end
    
    if love.keyboard.isDown("o") and bastao2.y > 10 then
        bastao2.y=bastao2.y-5
    end

    if love.keyboard.isDown("a") and bastao1.y < (love.graphics.getHeight() - (bastao1.h+10) )then
        bastao1.y = bastao1.y+5
    end
    if love.keyboard.isDown("l") and bastao2.y < (love.graphics.getHeight() - (bastao2.h+10) )then
        bastao2.y = bastao2.y+5
    end

    
end
 
-- Draw a coloured rectangle.
function love.draw()
    love.graphics.setColor(0, 0.4, 0.4)
    love.graphics.rectangle("fill", bastao1.x, bastao1.y, bastao1.w, bastao1.h)
    love.graphics.rectangle("fill", bastao2.x, bastao2.y, bastao2.w, bastao2.h)
    love.graphics.ellipse("fill",bola.x,bola.y,bola.rx,bola.ry)
end