require('prime')

class Euler50
  attr_accessor :primes, :memory, :prime_count, :max_key

  def initialize()
    puts "generating.."
    self.prime_count = 1_000_000
    self.primes = prime_count.times.select { |p| Prime.prime?(p) }
    puts "done.."
    find_consecutive()
  end

  def find_consecutive()
    rows = self.primes.map{ |p| [p] }
    current_len = 1
    while rows.length > 2
      rows = rows.select { |row| row.sum < self.prime_count }
      rows.each do |row|
        puts "#{row.inspect}: #{row.sum}" if Prime.prime?(row.sum)
        next_prime = nil
        if self.primes.index(row[-1])
          index = self.primes.index(row[-1])
          next_prime = self.primes[index + 1]
        end
        if next_prime.nil?
          next_prime = self.prime_count
        end
        row << next_prime
      end
    end
  end

end

euler = Euler50.new
