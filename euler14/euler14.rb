def collatz_seq(num)
  yield num
  loop do
    if num % 2 == 0
      num = num / 2
      yield num
    else
      num = 3 * num + 1
      yield num
    end
    return if num == 1
  end
end

max = []
max_n = 0
(3..1_000_000).each do |n|
  seq = []
  collatz_seq(n) do |n|
    seq.push(n)
  end
  if max.length < seq.length
    max_n = n
    max = seq
    puts "#{n}, #{seq.length}"
  end
end
