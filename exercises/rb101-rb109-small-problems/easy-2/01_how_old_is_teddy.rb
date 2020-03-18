def ask_name
  puts 'Please give a name:'
  name = gets.chomp
  name.size > 0 ? name : 'Teddy'
end

name = ask_name
puts "#{name} is #{rand(20..200)} years old!"