=begin
Protected Secret
Using the following code, add an instance method named compare_secret that compares the value of @secret from person1 with the value of @secret from person2.

Copy Code
class Person
  attr_writer :secret

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
Expected output:

Copy Code
false
=end

class Person
  attr_writer :secret

  def compare_secret(arg)
    self.secret == arg.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)