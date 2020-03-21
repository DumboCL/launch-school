DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

HEX_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' =>15
}

def string_to_integer(string)
  number_array = string.chars.map { |char| DIGITS[char] }
  count = 0
  sum = 0
  loop do
    break if number_array.size == 0
    sum += number_array.pop * (10 ** count)
    count += 1
  end

  sum
end


def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEX_DIGITS[char] }

  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end

puts hexadecimal_to_integer('4D9f') == 19871
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570