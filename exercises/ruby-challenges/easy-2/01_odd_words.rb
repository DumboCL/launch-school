def odd_words(str)
  words = str.split(/[ \.]+/)
  product = words.map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end.join(' ')

  str[-1] == '.' ? product.concat('.') : product
end


p odd_words('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
p odd_words('hello') == 'hello'
p odd_words('hello word.') == 'hello drow.'
p odd_words('hello word .') == 'hello drow.'
p odd_words('hello  word .') == 'hello drow.'
p odd_words('hello word   .') == 'hello drow.'
p odd_words('hello word world  .') == 'hello drow world.'
p odd_words('.') == '.'
p odd_words('') == ''
