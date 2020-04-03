def multiply_all_pairs(array_1, array_2)
  result = []
  array_1.product(array_2).each do |pair|
    result << pair[0] * pair[1]
  end

  result.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
