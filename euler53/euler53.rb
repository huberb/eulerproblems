def fac(n)
  return 1 if n == 0
  n * fac(n - 1)
end

def bin(n, r)
  fac(n) / (fac(r) * fac(n - r))
end

count = 0 
(1..100).each do |n|
  (1..n).each do |r|
    num = bin(n, r)
    if num > 1_000_000
      puts "bin(#{n}, #{r}) = #{num}"
      count += 1
    end
  end
end

puts count
