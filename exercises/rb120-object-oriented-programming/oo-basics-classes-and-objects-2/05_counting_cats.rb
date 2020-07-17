class Cat
  @@total_number = 0

  def initialize
    @@total_number += 1 
  end

  def self.total
    @@total_number
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total