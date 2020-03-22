def crunch(string)
  result = ''
  string.chars.each { |char| result << char if !char.eql?(result[-1, 1]) }
  result
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''