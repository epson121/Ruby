##
# Count vowels
def count_vowels(str)
	vow = ["a", "e", "i", "o", "u"]
	res = 0
	str.downcase.split("").each do |c|
		if vow.include? c
			res += 1
		end
	end
	res
end

# Examples
p count_vowels("asdsdsdsdsd")
p count_vowels("asdasdasdasd")

p count_vowels(gets.chomp)