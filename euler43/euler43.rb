# 0 [1,2,3]
# 01 [2, 3], 02 [1, 3], 03 [1, 2]
# 012 [3], 021 [3], 031 [2]

# def next_num(nums)
#   while nums.map{ |n| n[1].length }.max > 0
#     entry = nums[0]
#     nums = nums[1..-1]
#     str = entry[0]
#     rest = entry[1]
#     rest.each do |r|
#       nums << [ str + r.to_s, rest.clone - [r] ]
#     end
#   end
#   nums
# end
# 
# first = [ "0", [1, 2, 3, 4, 5, 6, 7] ]
# entries = [first]
# puts next_num(entries)

def pandigital(str)
  10.times.all? do |i|
    str.include?(i.to_s)
  end
end

def check(str)
  return false if str[2..4].to_i % 3 != 0
  return false if str[3..5].to_i % 5 != 0
  return false if str[5..7].to_i % 11 != 0
  return false if str[6..8].to_i % 13 != 0
  true
end

beginnings = (1..(1000 / 3).to_i).map{ |i| "0" * (3 - (i * 2).to_s.length) + (i * 2).to_s }
center = (1..(1000 / 7).to_i).map{ |i| "0" * (3 - (i * 7).to_s.length) + (i * 7).to_s }
endings = (1..(1000 / 17).to_i).map{ |i| "0" * (3 - (i * 17).to_s.length) + (i * 17).to_s }

strings = []
9.times do |i|
  beginnings.each do |b|
    center.each do |c|
      endings.each do |e|
        str = (i + 1).to_s + b + c + e
        if pandigital(str) and check(str)
          puts str
          strings << str
        end
      end
    end
  end
end

puts strings.map(&:to_i).uniq.sum
