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

def max_rotation(num)
  size = num.to_s.size
  count = size
  loop do
    break if count == 1
    num = rotate_rightmost_digits(num, count)
    count -= 1
  end

  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845