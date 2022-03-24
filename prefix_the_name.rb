# Prefix the Name
# Using the following code, add the appropriate accessor methods so that @name is returned with the added prefix 'Mr.'.

# Copy Code
# class Person
# end

# person1 = Person.new
# person1.name = 'James'
# puts person1.name
# Expected output:

# Copy Code
# Mr. James

class Person
  attr_reader :name

  def name=(string)
    @name = "Mr. #{string}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name