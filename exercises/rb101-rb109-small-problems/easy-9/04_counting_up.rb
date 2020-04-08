def sequence(num)
  if num > 0
    (1..num).to_a
  else
    (num..1).to_a
  end
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-1) == [-1, 0, 1]