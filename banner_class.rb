# Banner Class

# Behold this incomplete class for constructing boxed banners.

# class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#   end

#   def empty_line
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration

# Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

class Banner
  def initialize(message, size = message.size)
    @message = message

    if size >= message.size && size <=  300
      @size = size
    elsif size < message.size
      @size = message.size
    else
      @size = 300
    end

  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * (@size)}-+"
  end

  def empty_line
    "| #{(" " * (@size))} |"
  end

  def message_line
    if @size != @message.size
      "|" + (" " * ((@size - @message.size) / 2)) + " #{@message} " + (" " * ((@size - @message.size) / 2)) + "|"
    else
      "| #{@message} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner


banner2 = Banner.new('To boldly go where no one has gone before.', 60)
puts banner2

banner3 = Banner.new('To boldly go where no one has gone before.', 30)
puts banner3

banner4 = Banner.new('To boldly go where no one has gone before.', 909030)
puts banner4
