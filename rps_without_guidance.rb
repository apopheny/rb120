# Rock paper scissors is a game where a player and another player simultaneously choose one of three options: rock, paper, or scissors. If both players choose the same option, the round is a tie. Otherwise, rock beats scissors which beats paper which beats rock. If multiple rounds are played, head-tohead score may be tallied.

# Nouns: player, choice, round, engine, score
# Adjectives: choose, beats

# gameflow:
# welcome
# choice
# winner
# score
# next round


class RPSEngine
  def welcome
    puts 'Welcome to Rock Paper Scissors!'
    puts 'Please enter your name:'
  end

  def play_again?
  end

  def loop
  end
end

class Player
  attr_reader :name
  def initialize(name = 'Computer')
    @name = name
  end

  def choice
  end

end

class Round
  def winner?
  end
end

class Scoreboard
  
  protected

  def win_lose
  end

end