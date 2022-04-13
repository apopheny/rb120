
module Flightable
def fly
  # IMPLEMENTATION
end
end
class Superhero  
attr_accessor :ability
def self.fight_crime
  # IMPLEMENTATION
end
def initialize(name)
  @name = name
end
def announce_ability
  puts "I fight crime with my #{ability} ability!"
end
end
class LSMan < Superhero; end
class Ability
attr_reader :description
def initialize(description)
  @description = description
end
end
superman = Superhero.new('Superman')
superman.fly # => I am Superman, I am a superhero, and I can fly!
LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!**Remove the first line in self.fight_crime Change this so instead of saying "I am LSMan" it says "I am strong" except you can't change any of the code within Superhero