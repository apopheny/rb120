# Consider the following code:

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# Write the classes and methods that will be necessary to make this code run, and print the following output:

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

# The order of the output does not matter, so long as all of the information is presented.

# Further Exploration

# Add your own name and pets to this project.

# Suppose the shelter has a number of not-yet-adopted pets, and wants to manage them through this same system. Thus, you should be able to add the following output to the example output shown above:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.

# Can you make these updates to your solution? Did you need to change your class system at all? Were you able to make all of your changes without modifying the existing interface?


class Pet
  attr_reader :name, :species

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{@species} named #{@name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end

  def print_pets
    puts @pets
  end
end

class Shelter
  attr_reader :pets

  def initialize
    @owners = {}
    @pets = []
  end

  def adopt(owner = shelter, pet)
    owner.adopt(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each do |name, owner|
      if name != 'The Animal Shelter'
        puts "#{name} has adopted the following pets:"
        owner.print_pets
        puts
      else
        puts "#{name} has the following unadopted pets:"
        owner.print_pets
        puts
      end
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
iggy         = Pet.new('dog', 'Iggy')
dunkin       = Pet.new('dog', 'Dunkin')
charlie      = Pet.new('dog', 'Charlie')
lacey        = Pet.new('cat', 'Lacey')
gordita      = Pet.new('cat', 'Gordita')
pagliacci    = Pet.new('cat', 'Pagliacci')
taquito      = Pet.new('cat', 'Taquito')
daisy        = Pet.new('dog', 'Daisy')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')


cdouglass = Owner.new('C Douglass')
jdouglass = Owner.new('J Douglass')
phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
shelter = Shelter.new
animal_shelter = Owner.new('The Animal Shelter')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(cdouglass, iggy)
shelter.adopt(cdouglass, dunkin)
shelter.adopt(cdouglass, charlie)
shelter.adopt(cdouglass, lacey)
shelter.adopt(cdouglass, gordita)
shelter.adopt(cdouglass, pagliacci)
shelter.adopt(cdouglass, taquito)
shelter.adopt(jdouglass, daisy)
shelter.adopt(animal_shelter, ben)
shelter.adopt(animal_shelter, asta)
shelter.adopt(animal_shelter, laddie)
shelter.adopt(animal_shelter, fluffy)
shelter.adopt(animal_shelter, kat)
shelter.adopt(animal_shelter, chatterbox)
shelter.adopt(animal_shelter, bluebell)


shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{cdouglass.name} has #{cdouglass.number_of_pets} adopted pets."
puts "#{jdouglass.name} has #{jdouglass.number_of_pets} adopted pets."
puts "#{animal_shelter.name} has #{animal_shelter.number_of_pets} unadopted pets."
