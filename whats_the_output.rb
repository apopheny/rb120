=begin 
# What's the Output?

# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => 'My name is FLUFFY.'
puts fluffy  # => 'My name is FLUFFY.'
puts fluffy.name # => 'My name is FLUFFY.'
puts name # => 'My name is FLUFFY.'

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => 'My name is FLUFFY.'
puts fluffy  # => 'My name is FLUFFY.'
puts fluffy.name # => 'My name is FLUFFY.'
puts name # => 'My name is FLUFFY.'