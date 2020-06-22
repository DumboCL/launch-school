def rotate_array(arr)
  new_arr = arr.dup
  first = new_arr.shift
  new_arr << first
end

def rotate_rightmost_digits(number, snip_len)
  number_arr = number.to_s.chars
  size = number_arr.size
  new_arr = rotate_array(number_arr[size - snip_len, snip_len])
  (number_arr[0, size - snip_len] + new_arr).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917