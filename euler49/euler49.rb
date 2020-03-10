require 'prime'

def permutations(p, p2, p3)
  p2 = p2.to_s.chars
  p3 = p3.to_s.chars
  p.to_s.chars.each do |c|
    return false if not p2.include?(c)
    return false if not p3.include?(c)
    p2.delete_at(p2.index(c))
    p3.delete_at(p3.index(c))
  end
  true
end

def test(p)
  counter = 1
  while (p + counter * 2).to_s.length < 5
    p2 = p + counter
    p3 = p + counter * 2
    if Prime.prime?(p2) and Prime.prime?(p3) and permutations(p, p2, p3)
      puts "#{p}, #{p2}, #{p3}, increased by: #{counter}"
      puts "#{p}#{p2}#{p3}"
    end
    counter += 1
  end
end

Prime.each do |p|
  next if p.to_s.length < 4
  exit(1) if p.to_s.length > 4
  test(p)
end
