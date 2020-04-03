def substrings_at_start(string)
  array = []
  string_array = string.chars
  1.upto(string_array.size) do |size|
    array << string_array.first(size).join
  end

  array
end

def substrings(string)
  target_array = []
  string.length.times do |n|
    target_array += substrings_at_start(string[n, string.length - n])
  end

  target_array
end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]