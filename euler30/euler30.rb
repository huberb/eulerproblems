def test(n)
  n == n.to_s.chars.reduce(0) { |acc, c| acc + c.to_i ** 5 }
end

nums = []
(2..1000000).each do |i|
  if test(i)
    puts i
    nums << i
  end
end

puts "result: " + nums.sum.to_s
