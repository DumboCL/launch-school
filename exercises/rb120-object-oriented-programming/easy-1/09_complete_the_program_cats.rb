class Pet
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    "Vic"
    
  end
end

class Cat < Pet
  attr_reader :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{self.name} is #{self.age} years old and has #{self.color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch