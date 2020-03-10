require 'prime'

class Euler
  attr_accessor :primes

  def initialize(prime_count)
    self.primes = Prime.each(prime_count).to_a
  end

  def write_as_sum(n)
    primes.each do |prime|
      base = 1
      loop do
        test_num = prime + 2 * (base ** 2)
        if test_num == n
          puts "#{n} == #{prime} + 2 * #{base}^2"
          return
        end
        break if test_num > n
        base += 1
      end
    end
    puts "could not write as sum: #{n}"
    exit(1)
  end
end

e = Euler.new(100000)
(9..50000).step(2) do |i|
  next if Prime.prime?(i)
  e.write_as_sum(i)
end
