class Euler
  attr_accessor :matrix, :max, :solution_matrix

  def initialize
    self.max = 1_000_000_000
    self.matrix = File.open('./matrix.txt').readlines
    self.matrix = matrix.map{ |line| line.gsub("\n", "").split(",").map(&:to_i) }

    self.solution_matrix = self.matrix.length.times
      .map { self.matrix.length.times.map { self.max } }

    self.solution_matrix[0][0] = self.matrix[0][0]
  end

  def walk
    4.times do
      (0..self.matrix.length - 1).each do |i|
        (0..self.matrix[i].length - 1).each do |j|
          self.solution_matrix[i][j] = [ 
            self.solution_matrix[i][j],
            i > 0 ? self.solution_matrix[i - 1][j] + self.matrix[i][j] : self.max,
            j > 0 ? self.solution_matrix[i][j - 1] + self.matrix[i][j] : self.max,
            i < self.matrix.length - 1 ? self.solution_matrix[i + 1][j] + self.matrix[i][j] : self.max,
            j < self.matrix.length - 1 ? self.solution_matrix[i][j + 1] + self.matrix[i][j] : self.max
          ].min
        end
      end
    end
    self
  end

  def inspect
    "MATRIX:\n" +
      self.matrix.map { |line| line.map { |num| " #{num} " }.join + "\n" }.join +
      "SOLUTION:\n" +
      self.solution_matrix.map { |line| line.map { |num| " #{num} " }.join + "\n" }.join
  end

  def result
    self.solution_matrix[-1][-1]
  end

end

euler = Euler.new
euler.walk
puts euler.result
