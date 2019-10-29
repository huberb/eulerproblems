require 'prime'

puts Prime.first(10000000).select{ |i| i < 2000000 }.reduce(:+)
