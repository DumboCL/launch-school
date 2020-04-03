def substrings_at_start(string)
  array = []
  string_array = string.chars
  1.upto(string_array.size) do |size|
    array << string_array.first(size).join
  end

  array
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
