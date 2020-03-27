def halvsies(array)
  size_first = (array.size / 2.0).ceil
  array_1 = array.first(size_first)
  array_2 = array.last(array.size - size_first)
  return_array = []
  return_array << array_1 << array_2
end
  
puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]