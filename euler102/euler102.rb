class Point
  attr_reader :x, :y
  def initialize(x, y) @x = x.to_i; @y = y.to_i end
  def to_s() "#{@x}, #{@y}" end
end

class Line
  attr_accessor :p1, :p2

  def initialize(p1, p2) 
    self.p1 = p1
    self.p2 = p2 
  end

  def normalize(num)
    return num - (2 * Math::PI) if num > Math::PI
    return num + (2 * Math::PI) if num <= -Math::PI
    return num
  end

  def cuts(line)
    left_angle = normalize(Math.atan2(self.p1.y, self.p1.x) - Math.atan2(line.p1.y, line.p1.x))
    right_angle = normalize(Math.atan2(self.p1.y, self.p1.x) - Math.atan2(line.p2.y, line.p2.x))
    (left_angle < 0 and right_angle > 0) or (left_angle > 0 and right_angle < 0)
  end

end

def triangle_from_line(line)
  line = line.split(',')
  [
    Point.new(line[0], line[1]),
    Point.new(line[2], line[3]),
    Point.new(line[4], line[5])
  ]
end

def contains_center?(triangle)
  center = Point.new(0, 0)
  cut1 = Line.new(triangle[0], center).cuts(Line.new(triangle[1], triangle[2]))
  cut2 = Line.new(triangle[1], center).cuts(Line.new(triangle[0], triangle[2]))
  cut3 = Line.new(triangle[2], center).cuts(Line.new(triangle[0], triangle[1]))
  cut1 and cut2 and cut3
end

def main
  count = 0
  File.readlines('triangles.txt').each do |line|
    triangle = triangle_from_line(line)
    result = contains_center?(triangle)
    count += 1 if result
    puts "triangle: #{triangle[0]}, #{triangle[1]}, #{triangle[2]} contains center: #{result}"
  end
  puts count
end

main
