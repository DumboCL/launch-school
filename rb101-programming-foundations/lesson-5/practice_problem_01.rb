def desc_arr(array)
  num_array = array.map { |string| string.to_i }.sort
  num_array.reverse.map! { |num| num.to_s }
end

arr = ['10', '11', '9', '7', '8']
puts desc_arr(arr) == ['11', '10', '9', '8', '7']