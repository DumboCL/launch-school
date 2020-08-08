class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

p Fruit.new('x').instance_variables
p Pizza.new('x').instance_variables