# gets the last digit and raises it to power of counter
# then it is added to result
# handles only positive numbers
def bin_to_dec(number)
	counter = 0
	result = 0
	while number != 0
		temp = number % 10
		if temp > 1
			return "not a binary number"
		end
		result += temp * 2 ** counter
		counter += 1
		number /= 10
	end
	return result
end

# gets the result of number % 2. Appends the result at the
# beginning of the string and divides the number by 2 while > 0
# returns string
# handles only positive numbers
def dec_to_bin(number)
	result = ""
	if number < 0
		return "not a positive number"
	end
	while number != 0
		result.insert(0, (number % 2).to_s)
		number /= 2
	end
	return result
end


p bin_to_dec(1112)
p bin_to_dec(1010)
p bin_to_dec(100101)
p bin_to_dec(101010001010110010100101010010100101010)

p dec_to_bin(-7)
p dec_to_bin(10)
p dec_to_bin(37)
p dec_to_bin(362225509674)