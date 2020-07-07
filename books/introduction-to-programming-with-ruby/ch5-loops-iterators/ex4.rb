def rec_countdown(number)
  if number < 0
    return
  else
    puts number
    rec_countdown(number - 1)
  end
end

puts rec_countdown(10)