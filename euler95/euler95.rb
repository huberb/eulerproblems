def find_divisors(n)
  divs = []
  (1..Integer.sqrt(n)).each do |i|
    if n % i == 0
      if n / i == i
        divs.push(i)
      else
        divs.push(i)
        divs.push(n/i)
      end
    end
  end
  divs.delete(n)
  divs
end

def test_chain(n, length)
  curr = n
  chain = [n]
  length.times do |i|
    return [] if curr.nil?
    sum = find_divisors(curr).reduce(:+)
    if sum == n
      return chain
    else
      chain.push(sum)
    end
    curr = sum
  end
  return []
end

longest = []
t1 = Thread.new do
  (28..300000).each do |i|
    chain = test_chain(i, 15)
    if chain.length >= longest.length
      longest = chain 
      puts longest.inspect
    end
  end
end
t2 = Thread.new do
  (300001..500000).each do |i|
    chain = test_chain(i, 15)
    if chain.length >= longest.length
      longest = chain 
      puts longest.inspect
    end
  end
end
t3 = Thread.new do
  (500001..850000).each do |i|
    chain = test_chain(i, 15)
    if chain.length >= longest.length
      longest = chain 
      puts longest.inspect
    end
  end
end
t4 = Thread.new do
  (850001..1000000).each do |i|
    chain = test_chain(i, 15)
    if chain.length >= longest.length
      longest = chain 
      puts longest.inspect
    end
  end
end
t1.join
t2.join
t3.join
t4.join
puts "longest:"
puts longest
