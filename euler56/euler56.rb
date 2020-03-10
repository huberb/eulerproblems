max = 0

100.times do |i|
  100.times do |j|
    curr = (i ** j).to_s.chars.map(&:to_i).sum
    max = curr if max < curr
  end
end

puts max
