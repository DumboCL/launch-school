SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f

puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f

puts "The area of the room is #{(length * width).round(2)} square meters 
      (%0.3f square feet)." %(length * width * SQMETERS_TO_SQFEET)