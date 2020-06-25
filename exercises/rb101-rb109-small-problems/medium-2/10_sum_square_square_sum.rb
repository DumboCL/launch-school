def sum_square_difference(num)
  comp1 = (1..num).inject(:+)**2
  comp2 = (1..num).map{ |n| n**2 }.inject(:+)

  (comp1 - comp2).abs
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150