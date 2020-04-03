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

def palindromes(string)
  result = []
  substrings(string).each do |word|
    next if word.length == 1
    result << word if word == word.reverse
  end

  result
end


puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]