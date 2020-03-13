require 'pry'

def test(a, b)
  return false if a.to_s.chars.uniq.length == 1
  return false if b.to_s.chars.uniq.length == 1
  return false if a.to_s.include?("0")
  return false if b.to_s.include?("0")
  common_char = a.to_s.chars - (a.to_s.chars - b.to_s.chars)
  return false if common_char.length != 1
  a_1 = (a.to_s.chars - common_char).join.to_i
  b_1 = (b.to_s.chars - common_char).join.to_i
  a_1.to_f / b_1.to_f == a.to_f / b.to_f
end

results = []
(10..99).each do |i|
  (10..99).each do |j|
    res = test(i, j)
    if res
      results << [i, j].sort
      puts "#{i}, #{j}: #{res}"
    end
  end
end

puts results.uniq.inspect
product = results.uniq.reduce{ |value, acc| [ value[0] * acc[0], value[1] * acc[1] ] }
