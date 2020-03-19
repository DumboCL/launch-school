numbers = []
count = 0

puts '==> Enter the 1st number:'
numbers << gets.chomp.to_i

puts '==> Enter the 2nd number:'
numbers << gets.chomp.to_i

puts '==> Enter the 3rd number:'
numbers << gets.chomp.to_i

puts '==> Enter the 4th number:'
numbers << gets.chomp.to_i

puts '==> Enter the 5th number:'
numbers << gets.chomp.to_i

puts '==> Enter the last number:'
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end