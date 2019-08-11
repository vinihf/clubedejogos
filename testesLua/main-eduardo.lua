--[[
DEVELOPED BY EDUARDO GRADISCHNIG
--]]
function love.load()
    bastao1 = {}
    bastao1.x = 20
    bastao1.y = (love.graphics.getHeight()/2)-40
    bastao1.w = 30
    bastao1.h = 80

    bastao2 = {}
    bastao2.x = love.graphics.getWidth() - 50
    bastao2.y = (love.graphics.getHeight()/2)-40
    bastao2.w = 30
    bastao2.h = 80

    bola = {}
    bola.x = love.graphics.getWidth()/2
    bola.y = love.graphics.getHeight()/2
    bola.rx = 15
    bola.ry = 15
    
    primeiraVez = true
    bolaVaiParaEsquerda = false
    bolaVaiParaDireita = false

    pontuacaoBastao1 = 0
    pontuacaoBastao2 = 0

    bastao1Errou = false
    basta2Errou = false

    introDaBola = false
	
	bolaSobe1 = false
	bolaSobe2 = false
	bolaDesce1 = false
	bolaDesce2 = false
	
end
-- Increase the size of the rectangle every frame.
function love.update(dt)
    if primeiraVez == true then
      while bola.x < love.graphics.getWidth()-66 do
        bola.x = bola.x + 5
		bola.y = bola.y - 0.4
        break
      end
      if bola.x >= (love.graphics.getWidth()-66) then
        primeiraVez = false
      end
    end
	
	if introDaBola == true then
		if cont == 0 then
			bola.x = love.graphics.getWidth()/2
			bola.y = love.graphics.getHeight()/2
			cont = 1
			bastao1.x = 20
			bastao1.y = (love.graphics.getHeight()/2)-40
			bastao2.x = love.graphics.getWidth() - 50
			bastao2.y = (love.graphics.getHeight()/2)-40
		end
		if bastao2Errou == true then
			--Bastao 1 recomeça jogando
			if bola.x >= 67 then
				bola.x = bola.x - 5
				bola.y = bola.y + 0.4
			end
			if bola.x < 67 then
				bastao2Errou = false
				introDaBola = false
			end
		end
		if bastao1Errou == true then
			--Bastao 2 recomeça jogando
			if bola.x <= (love.graphics.getWidth()-67) then
				bola.x = bola.x + 5
				bola.y = bola.y - 0.4
			end
			if bola.x > (love.graphics.getWidth()-67) then
				bastao1Errou = false
				introDaBola = false
			end
		end
	end
    if introDaBola == false then
        --Daqui pra baixo só executa quando já deu a intro da bola
        if bola.x > love.graphics.getWidth() - 67 then
          if bola.y+14 >= bastao2.y and bola.y - 94 <= bastao2.y then
		  --A BOLA PEGOU NO BASTAO
            bolaVaiParaEsquerda = true
            bolaVaiParaDireita = false
			if bola.y >= bastao2.y + 40 then
				if bola.y < bastao2.y + 60 then
					bolaSobe1 = false
					bolaSobe2 = false
					bolaDesce1 = true
					bolaDesce2 = false
				else
					bolaSobe2 = false
					bolaSobe1 = false
					bolaDesce1 = false
					bolaDesce2 = true
				end
			else
				if bola.y > bastao2.y + 20 then
					bolaDesce1 = false
					bolaDesce2 = false
					bolaSobe1 = true
					bolaSobe2 = false
				else
					bolaSobe2 = true
					bolaSobe1 = false
					bolaDesce1 = false
					bolaDesce2 = false
				end
			end
          else
			--A BOLA NAO PEGOU NO BASTAO
            pontuacaoBastao1 = pontuacaoBastao1 + 1
			bola.x = bola.x + 50
            bastao2Errou = true
			cont = 0
            introDaBola = true
          end
        end
        if bola.x < 67 then
          if bola.y+14 >= bastao1.y and bola.y-94<= bastao1.y then
		  --A BOLA PEGOU NO BASTAO
            bolaVaiParaDireita = true
            bolaVaiParaEsquerda = false
			if bola.y >= bastao1.y + 40 then
				if bola.y < bastao1.y + 60 then
					bolaSobe1 = true
					bolaSobe2 = false
					bolaDesce1 = false
					bolaDesce2 = false
				else
					bolaSobe2 = true
					bolaSobe1 = false
					bolaDesce1 = false
					bolaDesce2 = false
				end
			else
				if bola.y > bastao1.y + 20 then
					bolaDesce1 = true
					bolaDesce2 = false
					bolaSobe1 = false
					bolaSobe2 = false
				else
					bolaSobe2 = false
					bolaSobe1 = false
					bolaDesce1 = false
					bolaDesce2 = true
				end
			end
          else
		  --A BOLA NAO PEGOU NO BASTAO
            pontuacaoBastao2 = pontuacaoBastao2 + 1
			bola.x = bola.x - 50
            bastao1Errou = true
			cont = 0
            introDaBola = true
          end
        end
        if bolaVaiParaEsquerda == true then
            bola.x = bola.x - 9
        end
        if bolaVaiParaDireita == true then
          bola.x = bola.x + 9
        end
		if bolaDesce1 == true then
			bola.y = bola.y + 1.9
			if bola.y >= love.graphics.getHeight() - 10 then
				bolaDesce1 = false
				bolaDesce2 = false
				bolaSobe2 = true
				bolaSobe1 = false
			end
		end
		if bolaDesce2 == true then
			bola.y = bola.y + 2.3
			if bola.y >= love.graphics.getHeight() - 10 then
				bolaDesce1 = false
				bolaDesce2 = false
				bolaSobe2 = true
				bolaSobe1 = false
			end
		end
		if bolaSobe1 == true then
			bola.y = bola.y - 1.8
			if bola.y <= 10 then
				bolaDesce1 = false
				bolaDesce2 = true
				bolaSobe2 = false
				bolaSobe1 = false
			end
		end
		if bolaSobe2 == true then
			bola.y = bola.y - 2.2
			if bola.y <= 10 then
				bolaDesce1 = false
				bolaDesce2 = true
				bolaSobe2 = false
				bolaSobe1 = false
			end
		end
    end
    --Aqui executa sempre
    if love.keyboard.isDown("q") and bastao1.y > 10 then
        bastao1.y=bastao1.y-6
    end
    
    if love.keyboard.isDown("o") and bastao2.y > 10 then
        bastao2.y=bastao2.y-6
    end

    if love.keyboard.isDown("a") and bastao1.y < (love.graphics.getHeight() - (bastao1.h+10) )then
        bastao1.y = bastao1.y+6
    end
    if love.keyboard.isDown("l") and bastao2.y < (love.graphics.getHeight() - (bastao2.h+10) )then
        bastao2.y = bastao2.y+6
    end
end
 
-- Draw a coloured rectangle.
function love.draw()
  
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", bastao1.x, bastao1.y, bastao1.w, bastao1.h)
    love.graphics.rectangle("fill", bastao2.x, bastao2.y, bastao2.w, bastao2.h)
	love.graphics.line(love.graphics.getWidth()/2,0,love.graphics.getWidth()/2,love.graphics.getHeight())
    
    love.graphics.setColor(0, 0, 1)
    love.graphics.ellipse("fill",bola.x,bola.y,bola.rx,bola.ry)
	
	love.graphics.print(pontuacaoBastao1,(love.graphics.getWidth()/2)-85,30,0,4,4)
	love.graphics.print(pontuacaoBastao2,(love.graphics.getWidth()/2)+50,30,0,4,4)
end
