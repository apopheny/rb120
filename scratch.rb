class Student
  def initialize(name)
    self.name = name
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">