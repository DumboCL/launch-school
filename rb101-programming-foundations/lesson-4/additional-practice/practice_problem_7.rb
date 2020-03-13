statement = "The Flintstones Rock"

char_frequency = {}

statement.chars.each do |char|
  if char_frequency[char] == nil
    char_frequency[char] = 1
  else
    char_frequency[char] += 1
  end
end

puts char_frequency