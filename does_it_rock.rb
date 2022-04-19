# Does it Rock or Not?
# We discovered Gary Bernhardt's repository for finding out whether something rocks or not, and decided to adapt it for a simple example.

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    raise AuthenticationError, 'API key is not valid.' unless valid?(api_key)

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      raise ZeroDivisionError if positive + negative == 0 # Dividing by zero with floats does not raise ZeroDivisionError, but returns Infinity instead
      positive / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)
    return "No idea about #{term}..." if score.class == DoesItRock::NoScore
    case score
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# In order to test the case when authentication fails, we can simply set API_KEY to any string other than the correct key. Now, when using a wrong API key, we want our mock search engine to raise an AuthenticationError, and we want the find_out method to catch this error and print its error message API key is not valid.

# Is this what you expect to happen given the code?

# And why do we always get the following output instead?
=begin
Sushi rocks!
Rain rocks!
Bug hunting rocks!
=end