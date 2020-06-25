def star(n)
  stars_arr = []
  half = n / 2
  0.upto(half-1) do |i|
    stars_arr << "*#{' ' * (n/2 - i - 1)}*#{' ' * (n/2 - i - 1)}*"
  end

  stars_arr << middle = '*' * n

  (half-1).downto(0) do |i|
    stars_arr << "*#{' ' * (n/2 - i - 1)}*#{' ' * (n/2 - i - 1)}*"
  end

  stars_arr.each do |line|
    puts line.center(n)
  end
  
end

star(7)
star(9)