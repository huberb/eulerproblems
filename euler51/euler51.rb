require 'prime'

def score(str, replacements)
  max_primes = []
  replacements.each do |r, _|
    cpy = str.gsub(/#{r}/, ".")
    primes = []
    (0..9).each do |i|
      curr = cpy.gsub(/\./, i.to_s)
      primes << curr if curr[0] != "0" and Prime.prime?(curr.to_i)
    end
    max_primes = primes if primes.length > max_primes.length
  end
  max_primes
end

def test(p)
  cpy = p.clone.to_s
  counter = Hash.new(0)
  cpy.chars.each do |c|
    counter[c] += 1
  end
  counter = counter.select{ |key, val| val > 1 }
  score(cpy, counter)
end

max_score = []
Prime.each do |p|
  score = test(p)
  if score.length > max_score.length
    max_score = score
    puts "#{p} got a score of #{score.length}. #{score.inspect}"
    break if max_score.length == 8
  end
end
