Game = Object:extend()

function Game:new()  
  config = gameConfig()
  math.randomseed(os.time())

  self.padLeft = Pad(config.padLeft)
  self.padRight = Pad(config.padRight)
  self.ball = Ball(config.ball)

  self.scoreLeft = 0
  self.scoreRight = 0
end

function Game:update(dt)
  self.padLeft:update(dt)
  self.padRight:update(dt)
  self.ball:update(dt)
  self.ball:bounce(self.padLeft)
  self.ball:bounce(self.padRight)

  local ball_status = self.ball:getOutOfBounds()

  if ball_status == "left"  then
    self.scoreRight = self.scoreRight + 1
    self.ball = Ball(config.ball)
  elseif ball_status == "right" then
    self.scoreLeft  = self.scoreLeft  + 1
    self.ball = Ball(config.ball)
  end
end

function Game:draw()
  for i=1,10 do
    love.graphics.rectangle("fill", 390, 80 * i, 20, 60)
  end

  self.padLeft:draw()
  self.padRight:draw()
  self.ball:draw()
  love.graphics.print(self.scoreLeft .. " - " .. self.scoreRight, 350, 20, 0, 4, 4)
end

function gameConfig()
  config = {}

  config.padLeft = {
    x = 50,
    y = 100,
    width = 10,
    height = 100,
    keyUp = "w",
    keyDown = "s"
  }

  config.padRight = {
    x = 740,
    y = 100,
    width = 10,
    height = 100,
    keyUp = "up",
    keyDown = "down"
  }

  config.ball = {
    x = 400,
    y = 300,
    radius = 15,
    segments = 15
  }
  return config
end