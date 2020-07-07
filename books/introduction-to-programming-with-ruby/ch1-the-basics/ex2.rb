a = 1234
thousands = a / 1000
hundreds = a % 1000 / 100
tens = a % 100 / 10
ones = a % 10

puts "a = #{a}"
puts "thousands = #{thousands}"
puts "hundreds = #{hundreds}"
puts "tens = #{tens}"
puts "ones = #{ones}"