class Sudoku

  def initialize(str)
    @sudoku = str.map{ |line| line.chars.map{ |c| c.to_i } }
    @preset = []
    9.times.each{ |x| 9.times.each{ |y| @preset.push([x, y]) if @sudoku[x][y] != 0 } }
  end

  def next_block(x, y)
    return nil if x == 8 && y == 8
    return { x: 0, y: y + 1 } if x == 8
    return { x: x + 1, y: y }
  end

  def solve_next(x, y)
    next_b = next_block(x, y)
    return true if next_b.nil?
    return true if solve(next_b[:x], next_b[:y])
    return false
  end

  def solve(x, y)
    if @preset.include?([x, y])
      return solve_next(x, y)
    else
      val = 1
      while val < 10
        @sudoku[x][y] = val
        unless check_collision(x, y)
          next_b = next_block(x, y)
          return true if next_b.nil?
          return true if solve(next_b[:x], next_b[:y])
        end
        val += 1
      end
      @sudoku[x][y] = 0
      return false
    end
  end

  def get_digits
    3.times.map{ |i| @sudoku[0][i].to_s }.join.to_i
  end

  def puts_sudoku
    @sudoku.each { |line| line.each { |c| print(c.to_s + " ") }; puts }
    puts
  end

  def check_block_collision(x, y)
    x_block = 10.times.to_a.each_slice(3).to_a.select{ |s| s.include?(x) }.first
    y_block = 10.times.to_a.each_slice(3).to_a.select{ |s| s.include?(y) }.first
    x_block.each do |x1|
      y_block.each do |y1|
        next if x == x1 && y == y1
        return true if @sudoku[x][y] == @sudoku[x1][y1]
      end
    end
    false
  end

  def check_collision(x, y)
    val = @sudoku[x][y]
    9.times.each do |i|
      next if i == y
      return true if val == @sudoku[x][i]
    end
    9.times.each do |i|
      next if i == x
      return true if val == @sudoku[i][y]
    end
    check_block_collision(x, y)
  end
end

def read_sudokus(path)
  File.open(path, 'r') do |file|
    file.readline()
    curr_sudoku = []
    file.each do |line|
      line = line.gsub(/\n/, '')
      if line.start_with?("Grid")
        yield curr_sudoku
        curr_sudoku = []
      else
        curr_sudoku.push(line)
      end
    end
    yield curr_sudoku
  end
end

all_digits = []
puts "this takes some time.."
read_sudokus('./sudoku.txt') do |sudoku|
  sudoku = Sudoku.new(sudoku)
  sudoku.solve(0, 0)
  sudoku.puts_sudoku
  all_digits.push(sudoku.get_digits)
end
sum = all_digits.reduce(:+)
puts "Sum: #{sum}"
