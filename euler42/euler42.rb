def read_file
  File.read('words.txt').gsub(/"/, '').split(',')
end

def tri(n)
  (n / 2.0) * (n + 1)
end

def num(c)
  c.ord - 64
end

def sum_of_word(word)
  word.chars.reduce(0){ |acc, c| acc + num(c) }
end

tris = 1000.times.map{ |i| tri(i) }

count = 0
read_file.each do |word|
  sum = sum_of_word(word)
  found = !tris.index(sum).nil?
  count += 1 if found
  # puts "#{word} == #{sum} -> #{found}"
end

puts count
