class Pet
  def initialize(category, name)
    @category = category
    @name = name
  end

  def to_s
    "a #{@category} named #{@name}"
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet_object)
    @pets << pet_object
  end

  def print_profile
    puts "#{name} has adopted the following pets:"
    @pets.each do |pet|
      puts pet
    end
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @owners = []
    @pets_without_owners = []
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    if !@owners.include?(owner)
      @owners << owner
    end
  end

  def add_pet(pet)
    @pets_without_owners << pet
  end

  def print_adoptions
    if @pets_without_owners.size > 0
      puts "The Animal Shelter has the following unadopted pets:"
      @pets_without_owners.each do |pet|
        puts pet
      end
    end

    puts ''

    @owners.each do |owner|
      owner.print_profile
      puts ''
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.add_pet(asta)
shelter.add_pet(laddie)
shelter.add_pet(fluffy)
shelter.add_pet(kat)
shelter.add_pet(ben)
shelter.add_pet(chatterbox)
shelter.add_pet(bluebell)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.