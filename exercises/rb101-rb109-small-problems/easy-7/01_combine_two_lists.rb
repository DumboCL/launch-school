def interleave(array_1, array_2)
  new_array = []
  array_1.each_with_index do |value, index|
    new_array << array_1[index] << array_2[index]
  end

  new_array
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']