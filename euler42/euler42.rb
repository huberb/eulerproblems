def read_file
  File.read('words.txt').gsub(/"/, '').split(',')
end

def tri(n)
  (n * 1/2) * (n + 1)
end

def num(c)
  c.ord - 64
end

tris = 1000000.times.map{ |i| tri(i) }
count = read_file.count do |word|
  sum = word.chars.reduce(0){ |acc, c| acc + num(c) }
  puts "#{word} == #{sum} -> #{!tris.index(sum).nil?}"
  tris.index(sum)
end

puts count
