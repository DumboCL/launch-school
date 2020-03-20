def oddities(ori_array)
  selected_array = []
  ori_array.each_with_index do |value, index|
    selected_array << value if index.even?
  end

  selected_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []