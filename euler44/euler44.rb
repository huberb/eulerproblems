def pen(n)
  n * (3 * n - 1) / 2
end

def pens(n)
  hash = {}
  n.times{ |i| hash[pen(i)] = i }
  hash
end

combos = []
pen_nums = pens(10000)
pen_nums.each do |i, _|
  pen_nums.select{ |j, val| j < i }.each do |j, _|
    next if i == j or i == 0 or j == 0
    if !pen_nums[i + j].nil? and !pen_nums[i - j].nil?
      combos << [i, j]
    end
  end
end

puts combos[0][0] - combos[0][1]
