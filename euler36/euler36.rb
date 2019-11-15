class Integer
  def to_b
    32.times
      .map{ |i| self >> i & 1 == 1 ? "1" : "0" }
      .reverse
      .drop_while{ |b| b != "1" }
      .join
  end
end

def palindrom?(str)
  (str.length / 2).times.all? do |i|
    i2 = str.length - i - 1
    str[i] == str[i2]
  end
end

nums = 1_000_000
  .times
  .select{ |n| palindrom?(n.to_s) and palindrom?(n.to_b) }

puts nums.inspect
puts nums.sum
