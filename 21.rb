require 'pry'
# 21 is a game where a player and a dealer draw cards from a 52 card deck to attempt to build a hand that sums up as close to 21 as possible without going over. The player goes first, and the dealer plays second. Cards are summed based on their numeric value, with face cards having a value of ten, and aces haveing a value of 11 unless that value would put the total over 21, in which case they are worth 1. 

# The dealer must hit until its total is at least 17, and stop when that total is reached. If either party goes over 21, they lose.

# Nouns:
# Deck, player, dealer, cards, ace
# Verbs:
# Total, draw, play, win, bust

# Deck
# -deal
# Player
# -draw
# -wager

# Balance

# Dealer
# -draw

# Game
# -start
# -total
# -bust
# -win
# Cards
# -ace

class Game
  def initialize
    game_engine
  end
  
  def game_engine
    display_welcome_message
    @deck = Deck.new
    @human = Player.new(:human)
    @dealer = Player.new(:dealer)
    deal_hands
    player_hit?
    dealer_hit
    showdown
    determine_winner
    display_goodbye_message
  end

  def deal_hands
    @human.hand, @dealer.hand = @deck.deal_starting_hand, @deck.deal_starting_hand
  end

  def clear
    system 'clear'
  end

  def display_game_state
    puts "Your hand is:"
    puts @human
    puts "Your hand score is:"
    puts @human.hand_total
    puts "#{@dealer.name} is showing:"
    puts @dealer
  end

  def player_hit?
    answer = nil
    loop do
      display_game_state
      puts ''
      puts "Would you like to draw a card? (Y/N)"
      answer = gets.chomp[0].upcase
      break if %w(Y N).include?(answer)
      puts ''
      puts "Sorry, that is an invalid response."
    end
    @human.hand += [@deck.deal_card] if answer == 'Y'
    player_hit? unless answer == "N" || @human.bust?
  end

  def showdown
    puts "#{@human.name} has: #{@human}."
    puts "Score: #{@human.hand_total}"
    puts ''
    puts "Dealer has:: #{@dealer.display_hand}."
    puts "Score: #{@dealer.hand_total}"
    puts ''
  end

  def determine_winner
    if @human.bust?
      declare_winner(@dealer.name)
    elsif @dealer.bust?
      declare_winner(@human.name)
    elsif @dealer.hand_total != @human.hand_total
      @dealer.hand_total > @human.hand_total ? declare_winner(@dealer.name) : 
      declare_winner(@human.name)
    else
      puts "It's a tie!"
    end
  end

  def declare_winner(winner)
    puts ''
    if winner == @human.name
      puts "#{@human.name} wins!"
    else
      puts "#{@dealer.name} wins!"
    end
  end

  def dealer_hit
    if @human.bust? == false
      until @dealer.hand_total >= 17
        @dealer.hand += [@deck.deal_card]
      end
    end
  end

  def display_welcome_message
    puts "Welcome to 21!"
  end

  def display_goodbye_message
    puts "Thanks for playing 21!"
    puts "Goodbye"
  end
end

class Player
  attr_accessor :hand
  attr_reader :name
  
  def initialize(type)
    @name = "Dealer"
    loop do
      break if type == :dealer
      puts "Please enter your name:"
      @name = gets.chomp.split.map(&:capitalize).join(' ')
      break if @name.size > 0 && @name != "Dealer"
      puts ""
      puts "That is not a valid entry."
      puts ""
    end
    @hand = nil
    @bankroll = Bankroll.new
  end

  def display_hand
    hand.join(', ')
  end

  def bust?
    hand_total > 21
  end
  
  def to_s
    self.name == "Dealer" ? "#{hand[0].join(' ')}" : hand.join(', ')
  end

  def hand_total
    values = @hand.map { |card| card[0].split[0] }.sort_by { |card| Deck::CARD_VALUES.index(card) }
    number_of_aces = values.count("A")
    values.delete("A")
    score = values.map { |card| card_value(card) }.sum
    number_of_aces.times do
      score += ace_value(score)
    end
    score
  end

  def card_value(card)
    if card == card.to_i.to_s
      card.to_i
    elsif %w(J Q K).include?(card)
      10
    end
  end

  def ace_value(score_without_aces)
    score_without_aces <= 10 ? 11 : 1
  end
end

class Deck
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(spades clubs diamonds hearts)
  def initialize
    @cards = CARD_VALUES.map { |card| create_suits(card) }.flatten(1)
  end

  def create_suits(card)
    SUITS.map { |suit| [card + " of #{suit}"] }
  end

  def deal_starting_hand
   cards.shuffle!
   [cards.pop, cards.pop].sort_by { |card| CARD_VALUES.index(card[0].split[0]) }.reverse
  end

  def deal_card
    cards.pop
  end

  protected
  attr_accessor :cards
end

class Bankroll
  def initialize
    @total = 1500
  end
end

Game.new