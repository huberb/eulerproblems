def test_upto(num, n)
  nums = []
  1.upto(n).each do |i|
    new = test(num, i)
    nums << new if pandigital?(new)
  end
  nums.max
end

def pandigital?(n)
  return false if n.to_s.include?("0")
  chars = n.to_s.chars
  1.upto(9).all?{ |i| chars.count(i.to_s) == 1 }
end

def test(num, n)
  nums = []
  n.times do |i|
    i += 1
    nums << num * i
  end
  nums.join.to_i
end

nums = []
(1..10_000).each do |i|
  new = test_upto(i, 9)
  if not new.nil?
    puts "#{i}: #{new}"
    nums << new 
  end
end

puts nums.max
