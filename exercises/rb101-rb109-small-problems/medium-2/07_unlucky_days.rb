require 'date'

def friday_13th(year)
  first_day = Date.new(year)
  count = 0
  365.times do |n|
    count += 1 if first_day.friday? && first_day.day == 13
    first_day = first_day.next_day
  end

  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2