def twice(num)
  num_string = num.to_s
  if num_string.length.even?
    if num_string[0, num_string.length / 2] == num_string[num_string.length / 2, num_string.length / 2]
      num
    else
      num * 2
    end
  else
    num * 2
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10