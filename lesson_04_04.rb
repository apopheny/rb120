# Question 1

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# >= is not an assignment method, therefore the `balance >= 0` line will refer to the getter method rather than the initialization of a local variable. Ben is right.

# Question 2

# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# In this case, the invocation of an assignment operator will cause the initialization of a local variables scoped at the method level, `quantity`, rather than the invocation of a reader method which returns the instance variable `@quantity`. Therefore, this code will assign that local variable to the method argument, and `@quantity` will remain untouched.

# In addition, the lack of a setter method will cause a NoMethodError exception even if `self.quantity` is used. `attr_accessor :quantity` should be added to the method body or else `update_quantity` should refer to the instance variable directly, `@quantity`

# Question 3

# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     quantity = updated_count if updated_count >= 0
#   end
# end

# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

# It exposes the `@quantity` instance variable to any calls to the accessor method, which could potentially allow the variable state to be updated directly outside of the utilization of the the `update_quantity` method. This could pose a security risk.

# Question 4

# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet "Hello"
  end
end

class Goodbye < Greeting
  def bye
    greet "Goodbye"
  end
end

# Question 5

# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single instance method called greet that takes a string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(string)
    p string
  end
end

class Hello < Greeting
  def hi
    p "Hello"
  end
end

class Goodbye < Greeting
  def bye
    p "Goodbye"
  end
end

wave = Hello.new
wave.greet(wave.hi)
sayonarra = Goodbye.new
sayonarra.greet(sayonarra.bye)

# Question 5
# You are given the following class that has been implemented:

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling = filling_type
    glaze = glazing
    filling = 'Plain' if filling == nil
    glaze == nil ? glaze = '' : glaze = 'with ' + glaze
    if glaze.empty?
      filling
    else
      "#{filling} #{glaze}"
    end
  end
end

# And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"
# Write additional code for KrispyKreme such that the puts statements will work as specified above.


# Question 6

# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# The first example instantiates the `@template` instance variable directly when the `create_template` method is invoked on a class object. 

# The second example uses the accessor method to instantiate the `@template` variable upon invocation of the `create_template` instance method..

# Both examples are technically fine, however, the general rule from the Ruby style guide is to "Avoid self where not required."

# Question 7

# How could you change the method name below so that the method name is more clear and less repetitive?

# class Light
#   attr_accessor :brightness, :color

#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def light_status
#     "I have a brightness level of #{brightness} and a color of #{color}"
#   end

end


class Light
  attr_accessor :lumens, :hue

  def initialize(brightness, color)
    @lumens = brightness
    @hue = color
  end

  def brightness_and_hue
    "I have a brightness level of #{lumens} and a color of #{hue}"
  end

end
