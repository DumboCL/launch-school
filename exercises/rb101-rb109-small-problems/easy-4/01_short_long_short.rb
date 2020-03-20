def short_long_short(string_1, string_2)
  if string_1.size > string_2.size
    return string_2 + string_1 + string_2
  else
    return string_1 + string_2 + string_1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"