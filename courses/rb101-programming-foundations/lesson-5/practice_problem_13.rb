arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |sub_arr|
  sort_arr = sub_arr.select do |num|
    num.odd?
  end
end

puts new_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

