def reverse_words(words_string)
  prep_words = []
  words_string.split.each_with_index do |word, index|
    prep_words << if word.size >= 5
                    word.reverse
                  else
                    word
                  end
  end

  prep_words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS