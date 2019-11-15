def factorial(n)
  n.downto(1).reduce(1) { |acc, i| i * acc }
end

def test(n)
  n == n.to_s.chars.reduce(0) { |acc, i| factorial(i.to_i) + acc }
end

nums = []
(3..10000000).each do |i|
  if test(i)
    puts i
    nums << i
  end
end

puts nums.sum
