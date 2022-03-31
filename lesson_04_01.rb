# Question 1

# Which of the following are objects in Ruby? 

#     true
#     "hello"
#     [1, 2, 3, "happy days"]
#     142

true # Boolean object
"hello" # String object
[1, 2, 3, "happy days"] # Array object containing 3 Integer objects and a string object
142 # Integer object

# If they are objects, how can you find out what class they belong to?

p true.class
p "hello".class
p [1, 2, 3, "happy days"].class
p 142.class

# Question 2

# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

p Car.new.go_fast
p Truck.new.go_fast

# Question 3

# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

# A: self.class returns the class of the calling object and string interpolation calls to_s on that return, allowing it to be interpolated in the output string. Since the calling objects has a class `Car`, this class will be output as a string along with the rest of the method string.

# Question 4

# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

AngryCat.new # simply creating a new instance
gordita = AngryCat.new # assigning a new instance to a top-level variable

# Question 5

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name # this will assign the argument to the initialize method parameter to a local variable, `name`
  end
end

class Pizza
  def initialize(name)
    @name = name # this will instantiate an instance variable, as the asperand is a key symbold for an instance variable
  end
end

p Fruit.new('mango').instance_variables
p Pizza.new('pepperoni').instance_variables

# Question 6

# What could we add to the class below to access the instance variable @volume?

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end
# end

class Cube
  attr_reader :volume # one option

  def initialize(volume)
    @volume = volume
  end

  def get_volume  # another option
    @volume
  end
end

p Cube.new(9000).instance_variable_get("@volume") # a third option I didn't know about

# Question 7

# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# A: The default return is the object class, id, and its state. If unsure, we could look in the documentation for Object. If unsure from where the method originates, we could invoke .ancestors on the object class and work our way up the inheritance chain until we encounter the method in documentation.

# Question 8

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# A: self refers to the calling object. For instance, if we had a Cat object initialized and we called the Cat#make_one_year_older method on that object one time, its @age instance variable would reassign from Integer 0 to 1.

gordita = Cat.new('polydactyl')
gordita.make_one_year_older
p gordita.age
# =>  1

# Question 9

# If we have a class such as the one below:

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

# In the name of the cats_count method we have used self. What does self refer to in this context?

# A: In this context, it refers to the Class, `Cat`, as it is scoped at the class level. Were we to instantiate only one Cat object, the class variable would reassign from 0 to 1, as so:

pagliacci = Cat.new('lapcat')
p Cat.cats_count
# =>  1

# Question 10

# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

coach = Bag.new('color', 'material')
p coach