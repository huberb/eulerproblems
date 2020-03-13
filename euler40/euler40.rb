str = "0"
i = 1
while str.length < 1_000_001
  str += i.to_s
  i += 1
end

indices = [ 1, 10, 100, 1_000, 10_000, 100_000, 1_000_000 ]
count = indices.reduce(1) do |acc, i| 
  puts "#{i}: #{str[i]}"
  acc * str[i].to_i
end

puts count
