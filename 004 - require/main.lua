function love.load()
  tick = require "libraries/tick"
  listOfRectangles = {}  
  tick.delay(function() print("Hello world!") end, 2)
end

function love.update(dt)
  tick.update(dt)
  for i,v in ipairs(listOfRectangles) do
    v.x = v.x + (v.speed * dt)
  end
end

function love.draw()
  for i,v in ipairs(listOfRectangles) do
    love.graphics.rectangle("line", v .x, v.y, v.width, v.height)
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then
    table.insert(listOfRectangles, createRectangle(300, 200, 50, 50, 100))
  end
end

function createRectangle(x, y, width, height, speed)
  rectangle = {}
  rectangle.x = x
  rectangle.y = y
  rectangle.width = width
  rectangle.height = height
  rectangle.speed = math.random(100, 500)
  return rectangle
end