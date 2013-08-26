##
# Count words in string
def count_words(string)
  word = string.gsub(/\W+/i, " ").downcase.split(" ");
  b = Hash.new(0);
  word.each do |v|
	b[v] += 1
  end
  b
end

p count_words("A man, a plan, a canal -- Panama")