# Description: Tic-tac-toe is a two-player game played on a board consisting of a 3x3 grid. Moves are played in each square of the grid taking alternate turns. One player plays X pieces, the other O, placing these pieces in a square. If either player fills 3 contiguous spaces, horizontilly, vertically, or diagonally, that player wins. If neither wins, the game ends in a tie.

# Nouns: Board, Player, Game, Turn, Square
# Verbs: Play, Win, Tie, Place

# Board
#   Square - elided
# Player
#   Play
# Game
#   Win
#   Tie
# Turn
#   Place

class TTTGame

  def initialize
    game_engine
  end
  
  def game_engine
    # Display Welcome
    # Get player name
    human = Player.new
    computer = Player.new
    game = Board.new
    # take turns
    # check for winner
    # update score
    # display score
    # ask to play again
    # exit message
  end
end

class Board
  def initialize
    # Board state
  end

end

class Turn
  def choose_move
    # Computer choice logic
    # Update board
    # Player choice
    # Player choice validation
    # Update board
  end

end

class Player

end

class Score
  
end

game = TTTGame.new