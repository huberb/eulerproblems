require('prime')

def left_prime(p)
  (p.to_s.length - 1).times do |i|
    p = p.to_s[1..-1].to_i
    return false if not Prime.prime?(p)
  end
  true
end

def right_prime(p)
  (p.to_s.length - 1).times do |i|
    p = p.to_s[0..-2].to_i
    return false if not Prime.prime?(p)
  end
  true
end

primes = (11..1_000_000).select do |i|
  Prime.prime?(i) and left_prime(i) and right_prime(i)
end

puts primes.inspect
puts primes.count
puts primes.sum
