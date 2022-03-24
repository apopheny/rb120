# Guaranteed Formatting
# Using the following code, add the appropriate accessor methods so that @name is capitalized upon assignment.

# Copy Code
# class Person
# end

# person1 = Person.new
# person1.name = 'eLiZaBeTh'
# puts person1.name
# Expected output:

# Copy Code
# Elizabeth

class Person
  attr_reader :name
  
  def name=(string)
    @name = string.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name