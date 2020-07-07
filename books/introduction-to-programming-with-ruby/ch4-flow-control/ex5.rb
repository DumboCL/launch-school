
def loc_number(number)
  case
  when number < 0
    "the number is negative"
  when number >= 0 && number <= 50
    "the number is between 0 and 50"
  when number >= 51 && number <= 100
    "the number is between 51 and 100"
  when number >100
    "the number is above 100"
  end
end

puts "please input a number between 0 and 100:"
number = gets.chomp.to_i

puts loc_number(number)