class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 8
  end

  def make_one_year_older
    age += 1
  end
end

kitty = Cat.new('type_a')
kitty.make_one_year_older
