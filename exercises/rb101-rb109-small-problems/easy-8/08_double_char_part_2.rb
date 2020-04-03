def double_consonants(string)
  new_string = string.chars.map do |char|
                 if char =~ /[bcdfghjklmnpqrstvwxyz]/i
                   char + char
                 else
                   char
                 end
               end
  new_string.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""