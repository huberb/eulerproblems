require('prime')

def rotate(n)
  chars = n.to_s.chars
  first = chars.first
  chars = chars.drop(1)
  (chars << first).join.to_i
end

def is_circular_prime?(p)
  return false if p.to_s.include?("0")
  len = p.to_s.length
  len.times do |i|
    p = rotate(p)
    return false if not Prime.prime?(p)
  end
  true
end

circular = (2..1_000_000)
  .select{ |i| Prime.prime?(i) }
  .select{ |p| is_circular_prime?(p) }

puts circular.inspect
puts circular.count
