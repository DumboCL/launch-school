words = "the flintstones rock"

def titleize(words)
  prep_words = words.split(' ')
  prep_words.map! { |word| word.capitalize!}
  prep_words.join(' ')
end

puts titleize(words)
