# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
  end
end

class Superhero    
  attr_accessor :ability
  
  def self.fight_crime
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

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
# ========================================================================
****
