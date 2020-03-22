def swap(string)
  words = string.split.each do |word|
    temp = word[0]
    word[0] = word[-1]
    word[-1] = temp
  end

  words.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
