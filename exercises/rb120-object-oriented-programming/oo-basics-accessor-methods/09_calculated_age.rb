class Person
  def age=(new_age)
    @age = new_age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age