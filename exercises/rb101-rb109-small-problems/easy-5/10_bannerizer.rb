def print_cover(length)
  string = '+'
  count = 0

  loop do
    break if count > length + 1
    string << '-'
    count += 1
  end

  string << '+'
  puts string
end

def print_blank(length)
  string = '|'
  count = 0

  loop do
    break if count > length + 1
    string << ' '
    count += 1
  end

  string << '|'
  puts string
end

def print_text(string)
  puts "| #{string} |" 
end

def print_in_box(string)
  if string.size > 76
    print_large_box(string)
  else
    print_cover(string.size)
    print_blank(string.size)
    print_text(string)
    print_blank(string.size)
    print_cover(string.size)
  end
end

def print_large_box(string)
  print_cover(76)
  print_blank(76)

  1.upto((string.length / 76.0).ceil) do
    if string.length < 76
      print_text(string.ljust(76, ' '))
    else
      print_text(string.slice!(0, 76))
    end
  end

  print_blank(76)
  print_cover(76)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('To boldly go where no one has gone before.To boldly dfdd go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.')