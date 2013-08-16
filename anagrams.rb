##
# An anagram is a word obtained by rearranging the letters of another word.  For 
# example, "rats", "tars" and "star" are an anagram group because they are made up of the same 
# letters.
# Given an array of strings, write a method that groups them into anagram groups and returns 
# the array of groups.  Case doesn't matter in classifying string as anagrams (but case should be 
# preserved in the output), and the order of the anagrams in the groups doesn't matter.
# Example:
# 	input: 
# 	['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
#  	=> output:  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], 
# 	["creams", "scream"]]
# 	
#  HINT: you can quickly tell if two words are anagrams by sorting their
#  letters, keeping in mind that upper vs lowercase doesn't matter

##
# determines whether words are anagrams
def is_anagram(w1, w2)
	w1.downcase.split("").sort.join == w2.downcase.split("").sort.join
end

##
# Accepts an array of +words+ and combines anagrams into subarrays
# Usage: 
# 	s = ['cars', 'for', 'potatoes', 'scar', 'jose', 'racs', 'four','scar', 'creams', 'mark', 'scar', 'scar', 'scream'] 
#	combine_anagrams(s)
def combine_anagrams(words)
	result = Array.new;
	array = Array.new;
	i = 0;
	j = i+1;
	while words.length > 0
		array << words[i];
		#print words;
		while j < words.length
			found_anagram = false;
			if is_anagram(words[i], words[j])
				#print "anagram je";
				found_anagram = true;
				array << words[j];
				words.delete_at(j);
			end
			if found_anagram == false
				j+= 1;
			end
		end
		#print array;
		words.delete(words[i]);
		result<<array;
		array = [];
		j = 1;
	end
	print result
	return result
end 
