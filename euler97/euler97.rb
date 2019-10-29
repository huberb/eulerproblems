require 'openssl'
x = 28433 * 2.to_bn.mod_exp(7830457, 10000000000) + 1
puts x.to_s.chars.last(10).join.to_i
