printf 'What is your age?'
age = gets.chomp.to_i

printf 'At what age would you like to retire?'
retire_age = gets.chomp.to_i

year_to_go = retire_age - age
retire_year = Time.now.year + year_to_go

puts "It's #{Time.now.year}. You will retire in #{retire_year}"
puts "You have only #{year_to_go} years of work to go!"