Circle = Shape:extend()

function Circle:new(x, y, radius, segments)
  Circle.super.new(self, x, y)
  self.radius = radius
  self.segments = segments
  self.speed = math.random(100, 500)
end

function Circle:draw()
  love.graphics.circle("line", self.x, self.y, self.radius, self.segments)
end