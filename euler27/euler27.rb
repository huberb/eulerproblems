require('prime')

def formula(a, p)
  n = 0
  loop do
    num = n ** 2 + a * n + p
    return n if not Prime.prime?(num)
    n += 1
  end
end

primes = (0..1000).select { |i| Prime.prime?(i) }
primes.each do |p|
  (0..1000).each do |i|
    results = []
    results << formula(i, p)
    results << formula(-i, p)
    results << formula(i, -p)
    puts "#{i}, #{p}: #{results.inspect}" if results.any?{ |r| r > 40 }
  end
end

puts formula(-61, 971)
puts -61 * 971
