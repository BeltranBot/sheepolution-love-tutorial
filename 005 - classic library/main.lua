function love.load()
  Object = require "libraries/classic/classic"
  require "classes/shapes/Shape"
  require "classes/shapes/Rectangle"
  require "classes/shapes/Circle"
  math.randomseed(os.time())

  -- listOfRectangles = {}   
  r1 = Rectangle(50, 50, 50, 50)
  r2 = Circle(50, 150, 100, 100)
  print(r1.speed, r2.speed)
end

function love.update(dt)
  r1:update(dt)
  r2:update(dt)
end

function love.draw()
  r1:draw()
  r2:draw()
end