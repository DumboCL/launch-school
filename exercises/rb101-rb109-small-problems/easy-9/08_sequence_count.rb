def sequence(num_1, num_2)
  result =[]
  count = 0
  loop do
    break if count == num_1
    result << num_2 * (count + 1)
    count += 1
  end

  result
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
