# Reading and Writing
# Add the appropriate accessor methods to the following code.

# Copy Code
# class Person
# end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name
# Expected output:

# Copy Code
# Jessica

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name