def triangle_numbers
  i = 1
  sum = 1
  loop do
    yield sum
    i += 1
    sum += i
  end
end

def factors(n)
  len = Math.sqrt(n) + 1
  factors = (1..len).collect do |i| 
    if n % i != 0
      0
    else
      if n / i == i
        1
      else
        2
      end
    end
  end
  factors.sum
end

triangle_numbers do |num|
  count = factors(num)
  puts count if count > 300
  if count > 500
    puts "FOUND: #{num}"
    exit
  end
end
