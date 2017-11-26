Pad = Entity:extend()

function Pad:new(pad)
  Pad.super.new(self, pad.x, pad.y, pad.width, pad.height)
  self.keyUp = pad.keyUp
  self.keyDown = pad.keyDown
end

function Pad:update(dt)
  if love.keyboard.isDown(self.keyUp) then
    self.ySpeed = -400
  elseif love.keyboard.isDown(self.keyDown) then
    self.ySpeed = 400
  else
    self.ySpeed = 0
  end
 
  Pad.super.update(self, dt)
end