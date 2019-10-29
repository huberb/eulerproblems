require 'prime'

def diagonal_numbers(max)
    n = 1
    count = 0
    curr_addition = 2
    while true do
        round_nums = []
        4.times.each do |i|
            n += curr_addition
            round_nums.push n
            count += 1
        end
        yield round_nums, curr_addition + 1
        return if count >= max
        curr_addition += 2
    end
end

count = 0
primes = 0
diagonal_numbers(90000) do |nums, side_length|
    count += nums.length
    primes += nums.count{ |i| Prime.prime?(i) }
    percentage = 100 * primes / count.to_f
    puts "Round: #{count / 4}, Side Length: #{side_length}, Percentage: #{percentage}%"
end
