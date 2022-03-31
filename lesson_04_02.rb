# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
p oracle.predict_the_future

# => "You will eat a nice lunch/take a nap soon/stay at work late" returned but not output

# Question 2

# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
p trip.predict_the_future

# "You will visit Vegas/fly to Fiju/romp in Rome" returned but not output. As the calling object is of the RoadTrip class, the inheritance lookup path will stop at that class rather than proceeding to its parent when looking for a `choices` variable or method

# Question 3

# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

#{Objectname}.ancestors

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?
p Orange.ancestors
# Orange: Orange, Taste, Object, Kernel, BasicObject
p HotSauce.ancestors
# HotSauce: Hotsauce, Taste, Object, Kernel, BasicObject

# Question 4

# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type # add this

  def initialize(type)
    @type = type
  end

  def type  # remove this
    @type
  end

  def type=(t)  # remove this
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"  # @ is no longer needed, and it is standard practice to eschew it when there is a getter/setter method (depending on use case)
  end
end

# Question 5

# There are a number of variables listed below. What are the different types and how do you know which is which?

excited_dog = "excited dog" # local variable. Without assignment/reassignment this could also refer to an instance variable, but as a result of the call to the assignment operator ruby will not look for an excited_dog method nor evaluate its return, and will instead initialize a local variable
@excited_dog = "excited dog"  # instance variable as indicated by the single asperand, although class instance variables also are a thing
@@excited_dog = "excited dog" # class variable as indicated by the double asperand

# Question 6

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# Television.manufacturer is a class method as a result of the self keyword prepended to the method name. This self still occurs at the class level, and it is only within the method body that another lower scope occurs.

# To call this method you would call the method on the class name: Television.manufacturer

# Question 7

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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# This is a class variable, which is assigned to Integer 0 and class initialization. When an object of the Cat class is instantiated, it will reassign to an Integer that is the previous assignment incremented by 1. 

# For example, instantiating 10 Cat objects should reassign it to 10 and it should start at 0 if none are instantiated.

p Cat.cats_count  # => 0
10.times { Cat.new('feral cat') }
p Cat.cats_count  # => 10


# Question 8

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo # < Game
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?


# Question 9

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# A: When calling Bingo#play, it would execute the method defined within the Bingo class, as the lookup path would terminate at the first place it looked: the class of the calling object

# Question 10

# What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

# Encapsulation allows for segregation of classes, states, and variables. This is beneficial as it limits the amount of "downstream" for any programmatic execution. That is, it limits dependencies, which can be especially beneficial when working on large products as well as with multiple team members.

# Objects allow for abstraction of code, allowing us to build methods which can be implemented naturally for the type of object we have conceived. This further allows us to build complex problems from small, sound, logical pieces which flow naturally.

# Namespacing and inheritance allow for us to group objects by their logical predecessors and similar types; namespacing also lends itself to encapsulation.

# Polymorphism allows us to treat objects of different classes similarly provided that we have implemented methods and classes in a way which allows us to. This can be inheritance-based or we can implement method names and behaviors in such a way that we can treat different objects similarly, i.e., duck-typing.

# LS Answer: ecause there are so many benefits to using OOP we will just summarize some of the major ones:

# Creating objects allows programmers to think more abstractly about the code they are writing.
# Objects are represented by nouns so are easier to conceptualize.
# It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
# It allows us to easily give functionality to different parts of an application without duplication.
# We can build applications faster as we can reuse pre-written code.
# As the software becomes more complex this complexity can be more easily managed.
