advice = "Few things in life are as important as house training your pet dinosaur."

words = advice.split
words.each_index do |index|
  if words[index].eql? "important"
    words[index] = "urgent"
  end
end

advice = words.join(' ')
puts advice
