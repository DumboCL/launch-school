def move_next_space(sentence)
  pre_space = false
  new_sentence = ''
  sentence.split('').each do |char|
    if !char.eql?(' ')
      new_sentence << char
      pre_space = false
    else 
      new_sentence << char if !pre_space
      pre_space = char == ' ' ? true : false
    end
  end

  new_sentence
end

def cleanup(sentence)
  sentence.gsub!(/[^a-z]/, ' ')
  move_next_space(sentence)
end

puts cleanup("---what's my +*& line?") == ' what s my line '