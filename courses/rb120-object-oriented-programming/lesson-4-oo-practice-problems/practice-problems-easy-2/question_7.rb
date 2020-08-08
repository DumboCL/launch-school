class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

kitty = Cat.new('type_a')
meow = Cat.new('type_b')
puts Cat.cats_count