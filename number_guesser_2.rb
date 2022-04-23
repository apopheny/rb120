# Number Guesser Part 2
# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

# Copy Code
# Math.log2(size_of_range).to_i + 1

class GuessNumber
  def initialize(range_min, range_max)
    @max_guesses = (Math.log2((range_min..range_max).size).to_i + 1)
    @range_min = range_min
    @range_max = range_max
  end

  def play
    @number = rand(@range_min..@range_max)
    @guesses_remaining = @max_guesses
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
    puts "Enter a number between #{@range_min} and #{@range_max}:"
    @guess = nil
    loop do
      @guess = gets.chomp.to_i
      break if (@range_min..@range_max).include?(@guess)
      puts "Invalid guess. Enter a number between #{@range_min} and #{@range_max}:"
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

game = GuessNumber.new(501, 1500)

game.play
