def fibonacci_last(nth)
  last, last_second = [1, 1]
  1.upto(nth - 2) do |num|
    last, last_second = [last + last_second, last]
  end

  last % 10
end

# better solution, only calculate the last digit of all the intermediate number
# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end


# p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) == 4 # -> 4

