def positions(string)
  string.downcase.bytes.map{ |b| b - 96 }
end

def read_names(filename)
  text = File.read(filename)
  text.split(',').map{ |name| name.gsub(/"/, "") }.sort
end


sum = 0
read_names('names.txt').each_with_index do |name, index|
  name_points = positions(name).sum
  points = name_points * (index + 1)
  sum += points
  puts "#{name}: #{name_points} * #{index + 1} = #{name_points * (index + 1)}"
end

puts sum
