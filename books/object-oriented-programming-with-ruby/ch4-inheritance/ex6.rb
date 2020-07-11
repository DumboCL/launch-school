module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false 
  end
end

class Vehicle
  attr_accessor :color, :model
  attr_reader :year

  @@number_of_vehicle = 0

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicle += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def age
    puts "Your #{self.model} is #{years_old} years old."
  end

  def to_s
    "My vehicle is #{color}, #{year}, #{model}!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicle} vehicles."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is #{color}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is #{color}, #{year}, #{model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.age