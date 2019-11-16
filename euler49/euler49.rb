sum = 0
1000.times do |i|
  i += 1
  sum += i ** i
end

puts sum.to_s[-10..-1]
