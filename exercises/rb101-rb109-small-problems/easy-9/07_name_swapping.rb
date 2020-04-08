def swap_name(string)
  name_array = string.split
  "#{name_array[1]}, #{name_array[0]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'