def read_paths
  File.open('./triangle.txt').readlines.map do |line|
    line.split(' ').map(&:to_i)
  end
end

def above_left(solutions, i, j)
  return -1_000_000 if j == 0
  return solutions[i - 1][j - 1]
end

def above_right(solutions, i, j)
  return -1_000_000 if j == solutions[i - 1].length
  return solutions[i - 1][j]
end

paths = read_paths
solutions = paths.clone.map { |line| line.map { -1 } }

solutions[0][0] = paths[0][0]
(1..solutions.length - 1).each do |i|
  solutions[i].length.times do |j|
    left = above_left(solutions, i, j) + paths[i][j]
    right = above_right(solutions, i, j) + paths[i][j]
    solutions[i][j] = [ left, right ].max
  end
end

puts solutions[-1].max
