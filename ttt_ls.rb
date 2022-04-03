require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]
 
  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  #return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |wincon|
      wincon_state = wincon.map { |key| @squares[key].marker }
      return TTTGame::HUMAN_MARKER if wincon_state.all?(TTTGame::HUMAN_MARKER)
      return TTTGame::COMPUTER_MARKER if wincon_state.all?(TTTGame::COMPUTER_MARKER)
    end
    false
  end
end

class Square
INITIAL_MARKER = " "

attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def clear
    system 'clear'
  end
  
  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts ""
  end
  
  def display_goodbye_message
    puts "Thanks for playing Tic-Tac-Toe! Goodbye!"
  end

  def display_board(clear_screen: true)
    clear if clear_screen
    puts "Player plays #{human.marker}. Computer plays #{computer.marker}"
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""

    def human_moves
      puts "Choose a square: (#{board.unmarked_keys.join(', ')})"
      square = nil
      loop do
        square = gets.chomp.to_i
        break if board.unmarked_keys.include?(square)
        puts "Sorry, but that's an invalid choice."
      end

      board.set_square_at(square, human.marker)
    end

    def computer_moves
      square = board.unmarked_keys.sample
      board.set_square_at(square, computer.marker)
    end
  end

  def play
    clear
    display_welcome_message
    loop do

      display_board(clear_screen: false)
      loop do
        human_moves
        break if board.full? || board.someone_won?
        
        computer_moves
        break if board.full? || board.someone_won?

        display_board
      end
      display_result

      break unless play_again?
      board.reset
      clear
      puts "Let's play again!"
      puts ''
    end
    display_goodbye_message
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'The computer won!'
    else
       puts "Board full!"
       puts ''
       puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if %w(y n).include? answer.downcase
      puts "Sorry, response must be y or n"
    end
    answer.downcase == 'y'
  end

end

game = TTTGame.new
game.play
