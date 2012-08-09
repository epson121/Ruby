#Luka Rajcevic 27.07. 2012.
#Write a method that determines whether a given word or phrase is a palindrome, that is, it 
#reads the same backwards as forwards, ignoring case, punctuation, and nonword characters.  
#(a "nonword character" is defined for our purposes as "a character that Ruby regexps would 
#treat as a nonword character".)  Your solution shouldn't use loops or iteration of any kind.   


def palindrome?(word)
   lol = (word.gsub(/\W+/i, "")).gsub(/\d+/i, "")
   if lol.downcase == lol.downcase.reverse
    return true;
   else
    return false;
   end
end

#palindrome?("A man, a plan, a canal -- Panama")

#Given a string of input, return a hash whose keys are words in the string and whose values 
#are the number of times each word appears.  Don't use for-loops.  (But iterators like each are 
#permitted.)  Nonwords should be ignored.  Case shouldn't matter.  A word is defined as a string 
#of characters between word boundaries.  (Hint: the sequence \b in a Ruby regexp means "word 
#boundary".)  
#Example: 
#count_words("A man, a plan, a canal -- Panama")
# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
#count_words "Doo bee doo bee doo"  # => {'doo' => 3, 'bee' => 2}
#def count_words(string)

def count_words(string)
  word = string.gsub(/\W+/i, " ").downcase.split(" ");
  b = Hash.new(0);
  word.each do |v|
	b[v] += 1
  end
  b.each do |k, v|
	puts "#{k} => #{v}"
  end
end


