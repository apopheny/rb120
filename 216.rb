# You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

# Your job is to return a list of complete numbers.

# The possible separators are: ["-", ":", ".."]

# -------------------------PROBLEM---------------------
# Questions: - Could it be anything that is not a number
#            - What happens when there is an empty string
#            - What happens an array ob obj
#            - What do you do for negative numbers / should you treat them the same

# Rules: There can multiple types of separators to signify a range (:, -, .., ..., *)
      
#         - range limits are inclusive
#         - there can be back to back to back ranges without a comma separator
# ----------------------DATA STRUCTURE------------------
# Input data: String 
#             - change the string into an array of strings (elements) backed on the spaces between them
#               ["1", "3"...]
              
# Output data: Array of integers

# -------------------------EXAMPLES--------------------
# "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21

# "1-3, 1-2" --> 1, 2, 3, 11, 12

# "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12

# "104-2" --> 104, 105, ... 112

# "104-02" --> 104, 105, ... 202

# "545, 64:11" --> 545, 564, 565, .. 611

def longhand(string)

end