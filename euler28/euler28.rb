class Euler
  attr_accessor :matrix, :size

  def initialize(size)
    self.size = size
    self.matrix = size.times.map{ size.times.map{ 0 } }
  end

  def fill
    i_0 = self.size / 2
    cycle_len = 1
    i = 0
    j = 1
    self.matrix[i_0][i_0] = 1
    counter = 2
    while cycle_len <= self.size / 2
      bounds = { :low => cycle_len * -1, :high => cycle_len }
      while i <= bounds[:high]
        self.matrix[i_0 + i][i_0 + j] = counter
        i += 1
        counter += 1
      end
      j -= 1
      i -= 1
      while j >= bounds[:low]
        self.matrix[i_0 + i][i_0 + j] = counter
        j -= 1
        counter += 1
      end
      j += 1
      i -= 1
      while i >= bounds[:low]
        self.matrix[i_0 + i][i_0 + j] = counter
        i -= 1
        counter += 1
      end
      j += 1
      i += 1
      while j <= bounds[:high]
        self.matrix[i_0 + i][i_0 + j] = counter
        j += 1
        counter += 1
      end
      cycle_len += 1
    end
    self
  end

  def sum
    s = 0
    self.matrix.length.times do |i|
      s += self.matrix[i][i]
    end
    self.matrix.length.times do |i|
      s += self.matrix[i][self.matrix.length - i - 1]
    end
    s - 1
  end

  def inspect
    str = self.matrix.map do |line|
      line.map{ |num| " #{num}, " }.join
    end
    str.map{ |m| m + "\n" }.join
  end

end

puts Euler.new(1001).fill.sum
