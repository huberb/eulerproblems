def all_nth_powers(n)
  curr = 0
  base = 1
  powers = []
  while curr.to_s.length <= n
    curr = base ** n
    if curr.to_s.length == n
      powers << curr
      puts "#{base} ^ #{n} == #{curr}" 
    end
    base += 1
  end
  powers
end

powers = []
(1..100).each do |i|
  powers << all_nth_powers(i)
  powers.flatten!
end

puts powers.inspect
puts powers.length
