coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
matrix = 201.times.map{ coins.map { 0 } }

(0..200).each do |i|
  coins.length.times do |j|
    if coins[j] > i
      matrix[i][j] = j - 1 >= 0 ? matrix[i][j-1] : 1
    else
      matrix[i][j] = j - 1 >= 0 ? matrix[i][j-1] + matrix[i - coins[j]][j] : 1
    end
  end
end

puts matrix[200][-1]
