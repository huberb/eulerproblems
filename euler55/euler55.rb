def is_palindrom(num)
  str = num.to_s
  (str.length / 2).times do |i|
    return false if str[i] != str[str.length - i - 1]
  end
  true
end

def reverse(num)
  num.to_s.reverse.to_i
end

def iterations_until_palindrom(num)
  iters = 0
  loop do
    num = num + reverse(num)
    iters += 1
    return iters if is_palindrom(num)
    return nil if iters > 50
  end
end

count = (1..10_000).count do |i|
  iters = iterations_until_palindrom(i)
  puts "#{i}: #{iters}"
  iters == nil
end

puts count
