DEGREE = "\xC2\xB0"
SECONDS_PER_DEGREE = 60 * 60

def dms(angle)
  total_seconds = SECONDS_PER_DEGREE * angle
  degree, remaining_seconds = total_seconds.divmod(3600)
  mins, seconds = remaining_seconds.divmod(60)

  "#{degree}#{DEGREE}#{Integer(mins).to_s.rjust(2, '0')}\'#{Integer(seconds).to_s.rjust(2, '0')}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(400°00'00")
puts dms(-40) == %(-40°00'00")
puts dms(-420) == %(-420°00'00")