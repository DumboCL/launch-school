my_array = ["first", "second", "third"]

my_array.each_with_index do | value, index |
  puts "index is #{index}"
  puts "value is #{value}"
end
