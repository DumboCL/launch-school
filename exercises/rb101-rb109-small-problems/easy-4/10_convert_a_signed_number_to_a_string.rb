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

def signed_integer_to_string(number)
  nega_sign = true
  number_string = ''
  if number < 0
    nega_sign = false
    number_string = '-' + integer_to_string(-number)
  elsif number == 0
    number_string = '0'
  else
    number_string = '+' + integer_to_string(number)
  end

  number_string
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'