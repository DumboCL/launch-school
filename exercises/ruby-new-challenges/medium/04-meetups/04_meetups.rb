require 'date'

class Meetup
  SCHE_TO_NTH = { 'first' => 1,
                  'second' => 2,
                  'third' => 3,
                  'fourth' => 4,
                  'fifth' => 5 }.freeze

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    case schedule.downcase
    when 'last' then date_from_last(weekday)
    when 'teenth' then date_from_teenth(weekday)
    else date_from_nth_weekday(weekday, SCHE_TO_NTH[schedule.downcase])
    end
  end

  protected

  attr_accessor :year, :month

  def date_from_nth_weekday(weekday, nth)
    schedule_count = 0
    day_count = 0
    starting_day = Date.civil(year, month)
    while schedule_count < nth
      schedule_count += 1 if starting_day.next_day(day_count).send("#{weekday.downcase}?")
      day_count += 1
    end

    Date.valid_date?(year, month, day_count) ? Date.civil(year, month, day_count) : nil
  end

  def date_from_last(weekday)
    7.times do |nth|
      the_day = Date.civil(year, month, -1 - nth)
      return the_day if the_day.send("#{weekday.downcase}?")
    end
  end

  def date_from_teenth(weekday)
    7.times do |nth|
      the_day = Date.civil(year, month, 19 - nth)
      return the_day if the_day.send("#{weekday.downcase}?")
    end
  end
end

# meetup = Meetup.new(2013, 4)
# p meetup.day('monday', 'FIRST')