def fib
  i = 2
  n_1 = 1; n_2 = 1
  yield 1, 1
  yield 1, 2
  loop do
    i += 1
    sum = n_1 + n_2
    if n_1 >= n_2
      n_2 = sum 
    else
      n_1 = sum
    end
    yield sum, i
  end
end

def main
  fib do |f, index|
    if f.to_s.length >= 1_000
      return f, index
    end
    # puts "#{f}, #{index}"
  end
end

puts main()
