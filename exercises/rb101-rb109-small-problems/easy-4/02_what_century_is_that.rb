def century(year)
  division, remainder = year.divmod(100)
  division += 1 if remainder > 0
  suffix = case division % 10
           when 1
             'st'
           when 2
             'nd'
           when 3
             'rd'
           else
             'th'
           end
  suffix = 'th' if [11, 12, 13].include? (division % 100)

  return "#{division}#{suffix}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'