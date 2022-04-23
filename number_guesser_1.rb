# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# Note that a game object should start a new game with a new number to guess with each call to #play.

class GuessNumber
  def play
    @number = (1..100).to_a.sample
    @guesses_remaining = 7
    loop do
      display_guesses
      get_guess
      if @guesses_remaining == 1
        lose
        break
      elsif @guess == @number
        win
        break
      elsif @guess < @number
        guess_low
      else
        guess_high
      end
      @guesses_remaining -= 1
    end
  end

  def display_guesses
    puts "You have #{@guesses_remaining} remaining."
  end

  def get_guess
    puts "Enter a number between 1 and 100:"
    @guess = nil
    loop do
      @guess = gets.chomp.to_i
      break if (1..100).include?(@guess)
      puts "Invalid guess. Enter a number betwee 1 and 100:"
    end
  end

  def guess_low
    puts "Your guess is too low."
  end

  def guess_high
    puts "Your guess is too high."
  end

  def win
    puts "That's the number! You win!"
  end

  def lose
    puts "You have no more guesses. You lost!"
  end
end

game = GuessNumber.new

game.play
