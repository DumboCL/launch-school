puts 'Please write word or multiple words:'
words = gets.chomp

number = words.split.join.size
puts "There are #{number} characters in \"#{words}\"."
