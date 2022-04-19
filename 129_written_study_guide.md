# Specific Topics of Interest
1. Classes and objects
* In ruby, nearly everything is an object, which means that they are a type of data in memory space with certain methods or behaviors available to them. There are some exceptions to this, such as blocks.
2. Use attr_* to create setter and getter methods / How to call setters and getters
* We can use `attr_reader`, `attr_writer`, and `attr_accessor` to create basic methods for the reading, writing, or reading and writing of class instance variables. To do so, we simply replace the `@` sign at the beginning of an instance variable name with an `:`, referring to it as a symbol. For example, for an instance variable `@var`, we would simply write a line within a class body as such: `attr_accessor :var`. References to the variable may then simply be coded as `var`, referring to the return value of the reader method. Care must be taken when using assignment methods, however, as this method would instead initialize a local variable scoped to an instance method:
  ```Ruby
  def reassign_var(argument)
    var = argument
  end
  ```
  We can avoid this by calling `self` directly, which will refer to the instance of the class for which `@var` is an instance variable, or else by referencing `@var` directly, although the former is the preferred practice. (Why?)
3. Instance methods vs. class methods
* Instance methods are called upon the instances of a class; that is, they alter the state of individual objects. `self` in the context of an instance method is the object id of a class object. They are defined similar to main-scoped methods, but within the body of a class. Class methods, however, are performed by the class as the calling object, or receiver. `self` in the context of a class method is the actual class. It is for this reason that a class method is defined within a method body as such:
  ```Ruby
  def self.output_hello
    puts 'hello'
  end
  ```
  If the class name were `Person`, for instance, `Person` would be the receiver, and we would call it thusly: `Person.output_hello`
4. Method Access Control
* Method access control refers to utilizing the privacy settings of a program language to limit the interface through which a user can interact with data through methods. Ruby has three categories of privacy settings:
  1. Public
    * This is the default state of methods within a class body, but a localized space within a class may be explicitly made public by utilizing the keyword `public`. At this point, the methods below will be available to be called outside of the class, within it, or between objects of the class, unless the keywords `private`, `protected`, or `end` are encountered at the same level of scope.
  2. Private
    * This is Ruby's most restrictive setting. Methods that are private may be called within the class or for a particular class object, but they may not be called outside of the class or between instances of it. If the class 
  3. Protected
    * This blends the previous two settings. These methods will not be able to be called outside of a class, but they can be called between objects of a class, or 
5. Referencing and setting instance variables vs. using getters and setters
6. Class inheritance, encapsulation, and polymorphism
7. Modules
8. Method lookup path
9. self
10. Calling methods with self
11. More about self
12. Reading OO code
13. Fake operators and equality
14. Working with collaborator objects
