require 'prime'

def pandigital(n)
  str = n.to_s
  str.length.times do |i|
    return false if not str.include?((i + 1).to_s)
  end
  true
end

Prime.each do |p|
  if pandigital(p)
    puts p
  end
end
