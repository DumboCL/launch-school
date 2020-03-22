DAY_MIN = 1440

def after_midnight(time_string)
  hours = time_string[0, 2].to_i
  mins = time_string[3, 2].to_i

  (hours * 60 + mins) % DAY_MIN
end

def before_midnight(time_string)
  (DAY_MIN - after_midnight(time_string)) % DAY_MIN
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0