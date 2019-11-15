def combinations(a, b)
  nums = []
  (2..a).each do |a_1|
    (2..b).each do |b_1|
      result = a_1 ** b_1
      puts "#{a_1}, #{b_1}: #{result}"
      nums << result
    end
  end
  nums.uniq.sort
end

combs = combinations(100, 100)
puts combs.length
