def capitalize(word)
  if word.length > 10
    return word.upcase 
  else
    return "the word is too short"
  end
end

puts capitalize("something")
puts capitalize("hello world")