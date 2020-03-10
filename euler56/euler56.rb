def test(num)
  digits = (1..6).map{ |n| num * n }
  first = digits[0].to_s.chars.sort
  !digits.any?{ |num| num.to_s.chars.sort != first }
end

num = 1
loop do
  result = test(num)
  puts "#{num}: #{result}"
  return if result
  num += 1
end
