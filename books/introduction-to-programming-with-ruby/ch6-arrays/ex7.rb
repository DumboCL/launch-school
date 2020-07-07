def arr_convert(arr)
  arr_after_convert = arr.map { |e| e + 2 }
  return arr_after_convert
end

arr = [1, 2, 3]
p "the old array is #{arr}"
p "the new array is #{arr_convert(arr)}"