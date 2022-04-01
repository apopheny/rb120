# Practice Problems: Easy 3
# Question 1
# If we have this code:

# Copy Code
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# What happens in each of the following cases:

# case 1:

# Copy Code
# hello = Hello.new
# hello.hi  # Outputs "Hello" and returns `nil`
# case 2:

# Copy Code
# hello = Hello.new
# hello.bye # Exception: undefined method 
# case 3:

# Copy Code
# hello = Hello.new
# hello.greet # Exception: Wrong number of arguments (0 for 1)
# case 4:

# Copy Code
# hello = Hello.new
# hello.greet("Goodbye")  # Outputs 'Goodbye' and returns `nil`
# case 5:

# Copy Code
# Hello.hi  # Exception: undefined method. This is a class method call for an instance method

# Question 2
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# Either define the method using sef.hi and the parent method as self.greet, or else instantiate a `Hello` obect and call the instance method on that object.

# Question 3
# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Call the BasicObject#.new method on the AngryCat class with pertinent arguments.

# Question 4
# Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

# class Cat
#   def initialize(type)
#     @type = type
#   end
# end

# How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

boo = Cat.new('tabby')
puts boo

# Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # undefined method exception
tv.model  # model method execution

Television.manufacturer # model method execution
Television.model  # NoMethodError exception

# Question 6
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# @age. Age could be used if the method did not call it with an assignment operator, but since it does it would be initializing a local variable `age`

taquito = Cat.new('fuzzy')
p taquito.age
taquito.make_one_year_older
p taquito.age

# Question 7
# What is used in this class but doesn't add any value?

# Copy Code

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# A: the self in the Light#information method

# LS answer: The answer here is the return in the information method. Ruby automatically returns the result of the last line of any method, so adding return to this line in the method does not add any value and so therefore should be avoided. We also never use the attr_accessor for brightness and color. Though, these methods do add potential value, as they give us the option to alter brightness and color outside the Light class.