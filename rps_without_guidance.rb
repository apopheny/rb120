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
  attr_reader :players
  attr_accessor :scoreboard

  YESNO = %w(y n)

  def initialize
    welcome
    start
    game_loop
  end
  
  def start
    name = gets.chomp.capitalize
    @players = []
    @scoreboard = []
    players[0], players[1] = Player.new(name), Player.new
  end

  def welcome
    system 'clear'
    puts 'Welcome to Rock Paper Scissors!'
    puts 'Please enter your name:
    '
  end

  def display_winner
    system 'clear'
    puts "
    #{players[0].name} played #{players[0].moves[-1]}."
  puts "
    #{players[1].name} played #{players[1].moves[-1]}."

  scoreboard[-1] != 'tie' ? (puts "
    #{scoreboard[-1]} won!") : (puts "
    It's a tie!")

    puts "
    #{players[0].name} has won #{count_wins(players[0].name)} games"
    puts "
    #{players[1].name} has won #{count_wins(players[1].name)} games"
  end

  def count_wins(player)
    scoreboard.count(player)
  end

  def play_again?

  puts "
    Would you like to play again? (Y/N)"
    answer = gets.chomp

    loop do 
      answer = YESNO.select { |ele| ele == answer[0].downcase }
      if answer.empty?
  puts "
    Please enter a valid response:"
      play_again?
      end
      break
    end

    answer[0] == 'y' ? game_loop : goodbye
  end

  def goodbye
    puts '
    Thank you for playing Rock Paper Scissors!'
    puts '
    Goodbye!'
  end

  def game_loop
    players[0].player_choice
    players[1].computer_choice
    determine_winner(players[0].moves[-1], players[1].moves[-1])
    display_winner
    play_again?
  end

  def determine_winner(player, computer)
    case player
    when "Rock"
      result = rock(computer)
    when "Paper"
      result = paper(computer)
    when "Scissors"
      result = scissors(computer)
    end
    if result == 'win'
      scoreboard << self.players[0].name
    elsif result == 'lose'
      scoreboard << self.players[1].name
    else
      scoreboard << 'tie'
    end
  end

  def rock(opponent_move)
    if opponent_move == 'Rock'
      'tie'
    elsif opponent_move == 'Paper'
      'lose'
    else
      'win'
    end
  end

  def paper(opponent_move)
    if opponent_move == 'Paper'
      'tie'
    elsif opponent_move == 'Scissors'
      'lose'
    else
      'win'
    end
  end

  def scissors(opponent_move)
    if opponent_move == 'Scissors'
      'tie'
    elsif opponent_move == 'Rock'
      'lose'
    else
      'win'
    end
  end
end

class Player
  attr_reader :name, :moves

  MOVE = %w(Rock Paper Scissors)

  def initialize(name = 'Computer')
    @name = name
    @moves = []
  end

  def computer_choice
    moves << MOVE.sample
  end

  def player_choice
    system 'clear'
    puts '
    Choose one:'
    puts MOVE
    puts ''
    round_choice = gets.chomp
  
    loop do 
      round_choice = MOVE.select do |element| 
        round_choice.capitalize == element ||
        round_choice[0].upcase == element[0]
      end
      if round_choice[0] == nil
        puts "
          Please enter a valid choice:"
        puts MOVE
        puts ''
        round_choice = gets.chomp
        next
      else
        round_choice = round_choice[0]
        break
      end
    end

    moves << round_choice
  end
end

game = RPSEngine.new