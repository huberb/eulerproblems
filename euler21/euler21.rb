def amicable?(n)
  divs = divisors(n).sum
  divs != n and n == divisors(divs).sum
end

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

amicables = []
(1..10000).each do |i|
  if amicable?(i)
    divs = divisors(i)
    other = divisors(divs.sum)
    puts "divs of #{i}: #{divs}, sum: #{divs.sum}; other: #{other}"
    amicables << i
  end
end

p amicables.sum
