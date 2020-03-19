puts 'What is the bill?'
bill = gets.chomp.to_f

puts 'What is the tip percentage?'
tip = gets.chomp.to_f / 100

tip_amount = bill * tip
total_bill = bill + tip_amount

puts "The tip is $#{sprintf("%.2f", tip_amount)}"
puts "The tip is $#{tip_amount.round(2)}"
puts "The total is $#{sprintf("%.2f", total_bill)}"