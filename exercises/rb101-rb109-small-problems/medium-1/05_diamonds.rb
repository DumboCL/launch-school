def diamond(n)
  1.upto(n) do |num_stars|
    if num_stars.odd?
      num_space = (n - num_stars) / 2
      puts ' ' * num_space + '*' * num_stars
    end
  end

  (n - 2).downto(1) do |num_stars|
    if num_stars.odd?
      num_space = (n - num_stars) / 2
      puts ' ' * num_space + '*' * num_stars
    end
  end
end

diamond(1)
diamond(3)
diamond(9)