def print_sum(limit)
  sum = 1.upto(limit).inject(:+)

  puts "The sum of the integers between 1 and #{limit} is #{sum}."
end

def print_product(limit)
  product = 1.upto(limit).inject(:*)

  puts "The product of the integers between 1 and #{limit} is #{product}."
end

puts 'Please enter an integer greater than 0:'
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operate = gets.chomp

if operate.downcase == 's'
  print_sum(number)
elsif operate.downcase == 'p'
  print_product(number)
end
    