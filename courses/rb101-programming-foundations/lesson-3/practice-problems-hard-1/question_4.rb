def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# return a false condition
# handling the case with more or fewer than 4 components

# My answer

def dot_separated_ip_address?(input_string)
  return_status = true

  dot_separated_words = input_string.split(".")
  return_status = false if dot_separated_words.size != 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return_status = false unless is_an_ip_number?(word)
  end

  return return_status
end

# LS answer

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
