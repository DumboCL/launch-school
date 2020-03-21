def running_total(numbers)
  sum = 0
  result = []
  numbers.each do |number|
    sum += number
    result << sum
  end

  result
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
