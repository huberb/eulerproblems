def to_long_str(n)
  (10 ** 5000 / n).to_s
end

def split_up(str, len)
  str.scan(/.{#{len}}/)
end

def find_repeats(str, lowest)
  while str[-1] == "0" do str = str[0..-2] end
  smallest_cycle = str.clone
  original_len = str.length
  (1..(str.length / 3)).each do |cycle_len|
    chunks = split_up(str, cycle_len)[1..-1]
    equal = chunks.all?{ |c| chunks[0] == c }
    # puts chunks.inspect, equal
    if equal and smallest_cycle.length > chunks[0].length
      smallest_cycle = chunks[0]
      return smallest_cycle if smallest_cycle.length < lowest
    end
  end
  smallest_cycle == str ? "" : smallest_cycle
end

max = "0"
index = 0
(2..1000).each do |i|
  cycle = find_repeats(to_long_str(i), max.length)
  if cycle.length > max.length
    max = cycle
    index = i
  end
  puts "1 / #{i} has cycle: #{cycle}, len: #{cycle.length}"
end

puts
puts index
