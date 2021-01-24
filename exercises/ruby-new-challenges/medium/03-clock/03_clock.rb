class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def +(other)
    adjust_minute(other)
    Clock.new(hours, minutes)
  end

  def -(other)
    adjust_minute(-other)
    Clock.new(hours, minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  protected

  attr_accessor :hours, :minutes

  def adjust_minute(minutes)
    convert_hours_minutes(total_minutes + minutes)
  end

  def total_minutes
    hours * 60 + minutes
  end

  def convert_hours_minutes(total_minutes)
    # p total_minutes
    self.hours = total_minutes / 60 % 24
    self.minutes = total_minutes % 60
  end
end

# clock1 = Clock.at(15, 37)
# clock2 = Clock.at(15, 36)
# clock3 = Clock.at(14, 37)
# p clock1.to_s
# p clock2.to_s
# p clock3.to_s
