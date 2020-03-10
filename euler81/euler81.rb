class Euler
  attr_accessor :max, :matrix, :solution_matrix

  def initialize
    self.max = 1_000_000_000
    self.matrix = File.open('./matrix.txt').readlines
    self.matrix = matrix.map{ |line| line.gsub("\n", "").split(",").map(&:to_i) }
    self.solution_matrix = self.matrix.length.times.map{ self.matrix.length.times.map { self.max } }
    self.solution_matrix[0][0] = self.matrix[0][0]
  end

  def walk
    (0..self.matrix.length - 1).each do |i|
      (0..self.matrix[i].length - 1).each do |j|
        first = self.solution_matrix[i][j]
        second = i > 0 ? self.solution_matrix[i - 1][j] + self.matrix[i][j] : self.max
        third = j > 0 ? self.solution_matrix[i][j - 1] + self.matrix[i][j] : self.max
        self.solution_matrix[i][j] = [ first, second, third ].min
      end
    end
    self
  end

  def result
    self.solution_matrix[self.solution_matrix.length - 1][self.solution_matrix[0].length - 1]
  end
end

puts Euler.new.walk.result
