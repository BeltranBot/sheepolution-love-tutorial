function love.load()
  x = 100
  y = 100
  distance = 250
  move = true
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + (distance * dt)
  elseif love.keyboard.isDown("left") then
    x = x - (distance * dt)
  end

  if love.keyboard.isDown("down") then
    y = y + (distance * dt)
  elseif love.keyboard.isDown("up") then
    y = y - (distance * dt)
  end
end

function love.draw()
  love.graphics.rectangle("fill", x, y, 20, 60)
end