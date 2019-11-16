# Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
# Pentagonal	Pn=n(3n−1)/2	1, 5, 12, 22, 35, ...
# Hexagonal	 	Hn=n(2n−1)	 	1, 6, 15, 28, 45, ...

def tri(n)
  n * (n + 1) / 2
end

def pen(n)
  n * (3 * n - 1) / 2
end

def hex(n)
  n * (2 * n - 1)
end

tris, pens, hexs = [], [], []
100000.times do |i|
  tris << tri(i)
  pens << pen(i)
  hexs << hex(i)
end

pens = Hash[pens.collect{ |p| [p, true] }]
hexs = Hash[hexs.collect{ |h| [h, true] }]

tris.each_with_index do |t, i|
  if hexs[t] and pens[t]
    puts t
  end
end
