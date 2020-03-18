def sum(root_number)
  digits_array = root_number.to_s.chars.map { |char| char.to_i }
  digits_array.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
