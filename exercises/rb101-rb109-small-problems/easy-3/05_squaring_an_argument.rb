def multiply(number1, number2)
  number1 * number2
end

def square(number)
  multiply(number, number)
end

puts square(5) == 25
puts square(-8) == 64
