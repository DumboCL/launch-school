def find_fibonacci_index_by_length(length)
  fibonacci = [1, 1]
  index = 1
  loop do
    break if fibonacci[index].to_s.size == length
    fibonacci << fibonacci[index - 1] + fibonacci[index]
    index += 1
  end
  index + 1
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847