class RPSGame
  attr_accessor :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = []
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break unless play_again?
    end
    display_goodbye_message
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner(move)
    if move.value == 'rock'
      move.rock(computer.move)
    elsif move.value == 'paper'
      move.paper(computer.move)
    elsif move.value == 'scissors'
      move.scissors(computer.move)
    elsif move.value == 'lizard'
      move.lizard(computer.move)
    elsif move.value == 'Spock'
      move.spock(computer.move)
    end
  end

  def display_winner
    if determine_winner(human.move) == 1
      puts "#{human.name} won!"
      score(human.name)
    elsif determine_winner(human.move) == -1
      puts "#{computer.name} won!"
      score(computer.name)
    else
      puts "It's a tie."
      score('tie')
    end
  end

  def score(result)
    scoreboard << result
  end

  def tiecount
    scoreboard.count('tie')
  end

  def display_score
    puts "#{human.name} has won #{scoreboard.count(human.name)} games."
    puts "#{computer.name} has won #{scoreboard.count(computer.name)} games."
    puts "#There #{tiecount == 1 ? 'has' : 'have'} been #{
      tiecount} #{tiecount == 1 ? 'tie' : 'ties'}."
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, answer must be y or n"
    end
    return true if answer == 'y'
    false
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors, Lizard, Spock!'
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end
end

class Move
  attr_reader :value

  VALUES = %w(rock paper scissors lizard Spock)

  def initialize(value)
    @value = value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'Spock'
  end

  def to_s
    @value
  end

  def rock(other_move)
    return 0 if other_move.rock?
    return 1 if other_move.scissors? || other_move.lizard?
    return -1 if other_move.spock? || other_move.paper?
  end

  def paper(other_move)
    return 0 if other_move.paper?
    return 1 if other_move.rock? || other_move.spock?
    return -1 if other_move.scissors? || other_move.lizard?
  end

  def scissors(other_move)
    return 0 if other_move.scissors?
    return 1 if other_move.paper? || other_move.lizard?
    return -1 if other_move.spock? || other_move.rock?
  end

  def lizard(other_move)
    return 0 if other_move.lizard?
    return 1 if other_move.spock? || other_move.paper?
    return -1 if other_move.rock? || other_move.scissors?
  end

  def spock(other_move)
    return 0 if other_move.spock?
    return 1 if other_move.rock? || other_move.scissors?
    return -1 if other_move.lizard? || other_move.paper?
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or Spock:"
      choice = gets.chomp
      break if %w(rock paper scissors lizard Spock).include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

RPSGame.new.play
