# Unexpected Change
# Modify the following code to accept a string containing a first and last name. The name should be split into two instance variables in the setter method, then joined in the getter method to form a full name.

# Copy Code
# class Person
#   attr_accessor :name
# end

# person1 = Person.new
# person1.name = 'John Doe'
# puts person1.name
# Expected output:

# Copy Code
# John Doe

class Person

  def name=(string)
    if string.split.size > 1
      @first_name, @last_name = string.split[0], string.split[1]
    else
      @first_name, @last_name = string, ''
    end
  end

  def name
    @last_name.empty? ? @first_name : "#{@first_name} #{@last_name}"
  end
      
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name