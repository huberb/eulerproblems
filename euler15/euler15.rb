# 20, 10, 4, 1
# 10,  6, 3, 1
#  4,  3, 2, 1
#  1,  1, 1, 0
class Grid
  attr_accessor :numbers, :grid_len

  def initialize(grid_len)
    self.grid_len = grid_len - 1
    self.numbers = Array.new(grid_len) { Array.new(grid_len) { 0 } }
  end

  def paths_from(x, y)
    if x == grid_len and y == grid_len
      return
    elsif x == grid_len
      numbers[x][y] = 1
    elsif y == grid_len
      numbers[x][y] = 1
    else
      numbers[x][y] = numbers[x + 1][y] + numbers[x][y + 1]
    end
  end
  
  def to_s
    str = "GRID_LEN: #{grid_len}\n"
    self.numbers.each do |row|
      str += row.join(", ") + "\n"
    end
    str
  end

  def solve
    end_index = grid_len
    while end_index >= 0
      y = end_index
      (0..end_index).reverse_each do |x|
        paths_from(x, y)
      end
      x = end_index
      (0..end_index).reverse_each do |y|
        paths_from(x, y)
      end
      end_index -= 1
    end
  end

end

grid = Grid.new(21)
grid.solve
puts grid.to_s
puts "RESULT: #{grid.numbers[0][0]}"
