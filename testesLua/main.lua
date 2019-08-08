
--function CheckCollision(ob1, ob2)
  --  return ob1.x < ob2.x+ob2.rx and
    --       ob2.x < ob1.x+ob1.w and
      --     ob1.y < ob2.y+ob2.ry and
        --   ob2.y < ob1.y+ob1.h
  --end

function CheckCollision(bas,bol)
    if bol.x > bas.x + bas.w or bas.x > bol.x + bol.rx then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if bol.y > bas.y + bas.h or bas.y > bol.y + bol.ry then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

-- Load some default values for our rectangle.
function love.load()

    love.graphics.setNewFont(40)

    bastao1 = {}
    bastao1.x = 20
    bastao1.y = (love.graphics.getHeight()/2)-30
    bastao1.w = 30
    bastao1.h = 60
    bastao1.d = ''
    bastao1.p = 0

    bastao2 = {}
    bastao2.x = love.graphics.getWidth() - 50
    bastao2.y = (love.graphics.getHeight()/2)-30
    bastao2.w = 30
    bastao2.h = 60
    bastao2.d = ''
    bastao2.p = 0

    bola = {}
    bola.x = love.graphics.getWidth()/2
    bola.y = love.graphics.getHeight()/2
    bola.rx = 20
    bola.ry = 20
    bola.a = 5
    bola.dx = 'e'
    bola.dy = 'b'
end
 
function love.update(dt)

    if bola.x < 0 then
        bola.x = love.graphics.getWidth()/2
        bola.y = love.graphics.getHeight()/2
        bastao2.p = bastao2.p+1
    end

    if bola.x >love.graphics.getWidth() then
        bola.x = love.graphics.getWidth()/2
        bola.y = love.graphics.getHeight()/2
        bastao1.p = bastao1.p+1
    end

    if CheckCollision(bastao1,bola) then
        bola.dx = 'd'
        bola.a = bola.a+0.1
    end

    if CheckCollision(bastao2,bola) then
        bola.dx = 'e'
        bola.a = bola.a+0.1
    end

    if bola.dx == 'e' then
        bola.x = bola.x - bola.a
    end 

    if bola.dx == 'd' then
        bola.x = bola.x + bola.a
    end

    if bola.dy == 'c' then
        bola.y = bola.y - bola.a
    end

    if bola.dy == 'b' then
        bola.y = bola.y + bola.a
    end

    if bola.y < 1 then
        bola.dy = 'b'
    end

    if bola.y > (love.graphics.getHeight()-bola.ry) then
        bola.dy = 'c'
    end

    if love.keyboard.isDown("q") and bastao1.y > 10 then
        bastao1.y=bastao1.y-5
        bastao1.d='c'
    end
    
    if love.keyboard.isDown("o") and bastao2.y > 10 then
        bastao2.y=bastao2.y-5
        bastao2.d='c'
    end

    if love.keyboard.isDown("a") and bastao1.y < (love.graphics.getHeight() - (bastao1.h+10) )then
        bastao1.y = bastao1.y+5
        bastao1.d='b'
    end
    if love.keyboard.isDown("l") and bastao2.y < (love.graphics.getHeight() - (bastao2.h+10) )then
        bastao2.y = bastao2.y+5
        bastao2.d='b'
    end
end


-- Draw a coloured rectangle.
function love.draw()
    love.graphics.setColor(0, 0.4, 0.4)
    love.graphics.rectangle("fill", bastao1.x, bastao1.y, bastao1.w, bastao1.h)
    love.graphics.rectangle("fill", bastao2.x, bastao2.y, bastao2.w, bastao2.h)
    love.graphics.ellipse("fill",bola.x,bola.y,bola.rx,bola.ry)
    love.graphics.print(bastao1.p, (love.graphics.getWidth()/2) - 50, 10)
    love.graphics.print(bastao2.p, (love.graphics.getWidth()/2) + 50, 10)
end