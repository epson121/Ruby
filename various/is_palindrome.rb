##
# Check if palindrome
def palindrome?(word)
   lol = (word.gsub(/\W+/i, "")).gsub(/\d+/i, "")
   if lol.downcase == lol.downcase.reverse
    return true;
   else
    return false;
   end
end

# Examples
p palindrome?("A man, a plan, a canal -- Panama")
p palindrome?("Not a plindrome.")