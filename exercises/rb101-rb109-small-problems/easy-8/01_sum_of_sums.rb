def sum_of_array(array)
  array.sum
end

def sum_of_sums(array)
  size_of_subarray = 1
  sum = 0
  1.upto(array.size) do |length|
    sum += sum_of_array(array.first(length))
  end

  sum
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35