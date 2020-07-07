puts "please input a number between 0 and 100:"
number = gets.chomp.to_i

case
when number >= 0 && number <= 50
  puts "the number is between 0 and 50"
when number >= 51 && number <= 100
  puts "the number is between 51 and 100"
when number >100
  puts "the number is above 100"
end

# below is the solution provided by LS, which covers more edge cases
if number < 0
  puts "the number is a negative integer"
elsif number <= 50
  puts "the number is between 0 and 50"
elsif number <= 100
  puts "the number is between 51 and 100"
else
  puts "the number is above 100"
end
    
    