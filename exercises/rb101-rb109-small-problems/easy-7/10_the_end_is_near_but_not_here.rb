def penultimate(string)
  string.split[-2]
end

def middle_word(string)
  word_array = string.split
  word_array
  word_array[(word_array.size / 2).floor]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

puts middle_word('last word') == 'word'
puts middle_word('Launch School is great!') == 'is'
puts middle_word('') == nil
puts middle_word('1 2 3 4 5') == '3'
puts middle_word('one') == 'one'