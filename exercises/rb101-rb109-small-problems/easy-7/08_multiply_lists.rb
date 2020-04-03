def multiply_list(array_1, array_2)
  index = 0
  new_array = []

  loop do
    break if index == array_1.size
    new_array << array_1[index] * array_2[index]
    index += 1
  end

  new_array
end

def multiply_list_zip(array_1, array_2)
  c = []
  array_1.zip(array_2) { |a, b| c << a * b }

  c
end


puts multiply_list_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]