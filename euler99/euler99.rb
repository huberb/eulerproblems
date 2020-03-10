lines = File.open('./p099_base_exp.txt').readlines
lines = lines.map { |line| line.split(",").map(&:to_i) }

def convert_to_base_10(num, exp)
  new_exp = exp * Math.log(num) / Math.log(10)
  puts "#{num} ** #{exp} == #{10} ** #{new_exp}"
  new_exp
end

converted_lines = lines.map do |line|
  num = line[0]
  exp = line[1]
  convert_to_base_10(num, exp)
end

puts converted_lines.each_with_index.max[1] + 1
