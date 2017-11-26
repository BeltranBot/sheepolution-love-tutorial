Ball = Entity:extend()

function Ball:new(ball)
  Ball.super.new(self, ball.x, ball.y, ball.radius, ball.segments)
  self.xSpeed = randomSign() * math.random(300, 500)
  self.ySpeed = randomSign() * math.random(300, 500)
  self.timer = 1
end

function Ball:update(dt)
  if self.timer > 0 then
    self.timer = self.timer - dt
  else
    Ball.super.update(self, dt)
  end
end

function Ball:bounce(e)
  local left1 = self.x
  local right1 = self.x + self.width
  local top1 = self.y
  local bottom1 = self.y + self.height

  local left2 = e.x
  local right2 = e.x + e.width
  local top2 = e.y
  local bottom2 = e.y + e.height

  if left1 < right2 and right1 > left2
                    and top1 < bottom2
                    and bottom1 > top2 then
    self.xSpeed = -self.xSpeed
  end
end

function Ball:getOutOfBounds()
  if self.x + self.width < 0 then
    return "left"
  elseif self.x + self.width > 800 then
    return "right"
  else
    return false
  end
end

function randomSign()
  return (math.random(0,1) == 1 and 1 or -1)
end