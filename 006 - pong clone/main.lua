function love.load()
  Object = require "libraries/classic/classic"
  require "game"
  require "Entities/entity"
  require "Entities/pad"
  require "Entities/ball"

  game = Game()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  game:draw()
end

function love.keypressed(k)
  if k == "r" then
    love.load()
  end
end