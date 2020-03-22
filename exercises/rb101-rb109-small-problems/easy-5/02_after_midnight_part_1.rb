DAY_MIN = 1440

def time_of_day(time)
  remain = 0

  if time > 0
    remain = time % DAY_MIN
  elsif time < 0
    remain = (DAY_MIN + time) % DAY_MIN
  end

  hours, mins = remain.divmod(60)
  hour = hours.to_s.rjust(2, '0')
  min = mins.to_s.rjust(2, '0')

  "#{hour}:#{min}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
