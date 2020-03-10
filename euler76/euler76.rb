nums = (1..99).to_a
matrix = 101.times.map{ nums.length.times.map{ 0 } }

matrix.length.times do |i|
  matrix[0].length.times do |j|
    if i >= nums[j]
      matrix[i][j] = j - 1 < 0 ? 1 : matrix[i][j - 1] + matrix[i - nums[j]][j]
    else
      matrix[i][j] = j - 1 < 0 ? 1 : matrix[i][j - 1]
    end
  end
end

puts matrix[-1][-1]
