require 'prime'

def prime_factors(primes, n)
  factors = []
  index = 0
  while n > 1
    curr = primes[index]
    raise 'out of primes' if curr.nil?
    if n % curr == 0
      factors << curr
      n /= curr
      index = -1
    end
    index += 1
  end
  factors.uniq
end

primes = Prime.take(20000)
(640..10_000_000).each do |i|
  if prime_factors(primes, i).length == 4 and
      prime_factors(primes, i + 1).length == 4 and
      prime_factors(primes, i + 2).length == 4 and
      prime_factors(primes, i + 3).length == 4
    puts i
    break
  end
end
