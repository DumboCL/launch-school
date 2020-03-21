CHARS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(number)
  number_array = []
  division = number

  loop do
    division, remainder = number.divmod(10)
    number_array << remainder
    number = division
    break if division == 0
  end

  number_array.reverse!.map! { |number| CHARS[number]}
  number_array.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'