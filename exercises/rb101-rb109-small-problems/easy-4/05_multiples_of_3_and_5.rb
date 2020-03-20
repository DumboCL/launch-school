def multisum(limit)
  sum_array = []
  1.upto(limit) do |number|
    sum_array << number if number % 3 == 0 or number % 5 == 0
  end
  sum_array.inject(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168