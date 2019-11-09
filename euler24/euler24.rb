def list_permutations(nums)
  index = 1
  nums.permutation.each do |permutation|
    puts permutation.inspect
    return permutation if index == 1_000_000
    index += 1
  end
end

puts list_permutations([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]).join
