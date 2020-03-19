number = 1
loop do 
  break if number > 99
  puts number if number.even?
  number += 1
end