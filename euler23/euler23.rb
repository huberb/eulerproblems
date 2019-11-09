def divisors(n)
  divs = []
  max = Math.sqrt(n).to_i
  (1..max).each do |i|
    if n % i == 0
      if i != n / i
        divs << i
        divs << n / i
      else
        divs << i
      end
    end
  end
  divs.delete(n)
  divs
end

def abundant?(n)
  divisors(n).sum > n
end

def sum_of_abundant?(abundants, n)
  current = 0
  while abundants[current] < n
    if abundants[current] * 2 == n
      # puts "#{abundants[current]} * 2 == #{n}"
      return true
    end
    other = n - abundants[current]
    index_other = abundants.index(other)
    if index_other
      # puts "#{abundants[current]} + #{abundants[index_other]} == #{n}"
      return true
    end
    current += 1
  end
  false
end

abundants = []
(0..28123).each do |i|
  abundants << i if abundant?(i)
end

result = []
(0..28123).each do |i|
  if !sum_of_abundant?(abundants, i)
    puts i
    result << i
  end
end
puts result.sum
