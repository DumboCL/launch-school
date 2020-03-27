def triangle_1(length)
  count = 1
  loop do
    break if count > length
    puts '*' * count + ' ' * (length - count)
    count += 1
  end
end

def triangle_2(length)
  count = 1
  loop do
    break if count > length
    puts ' ' * (length - count) + '*' * count
    count += 1
  end
end

triangle_1(5)
triangle_1(9)
triangle_2(5)
triangle_2(9)
