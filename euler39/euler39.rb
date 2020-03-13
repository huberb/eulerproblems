def solutions(p)
  sol = []
  (1..500).each do |i|
    (1..500).each do |j|
      c = p - i - j
      next if c < 0
      if c * c == i * i + j * j
        sol << [i, j, c].sort
        # puts "#{c}, #{i}, #{j}"
      end
    end
  end
  sol.uniq
end

max = []
max_index = 1
1000.times do |i|
  sol = solutions(i)
  if sol.length > max.length
    max = sol
    max_index = i
  end
end

puts max
puts max_index
