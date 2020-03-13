def pandigital(a, b, c)
  digits = [ a, b, c ].map(&:to_s).map(&:chars).join
  digits.length == 9 and (1..9).all?{ |i| digits.include?(i.to_s) }
end

products = []
2000.times do |a|
  2000.times do |b|
    c = a * b
    if pandigital(a, b, c)
      products << c
      puts "#{a}, #{b}, #{c}"
    end
  end
end

puts products.inspect
puts products.uniq.inspect
puts products.uniq.sum
