def has_number(num, arr)
  if arr.include?(num)
    return true
  else
    return false
  end
end

arr = [1, 3, 5, 7, 9, 11]
number = 2


if has_number(number, arr)
  puts "yes, the number appears in the array"
else
  puts "no, it does not in the array"
end
