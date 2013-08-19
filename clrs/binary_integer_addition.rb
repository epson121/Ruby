##
# Program that sums two binary numbers given in the form
# of an array. +b1+ and +b2+ are two equally-sized array of 1's and 0's
# Examples:
# 	p binary_integer_addition([1, 0, 0, 0 ,1], 
#							  [1, 1, 1, 1, 0])
# 	=> [1, 0, 1, 1, 1, 1]
#
# 	p binary_integer_addition([1, 0, 1, 0 ,1, 0], 
#							  [1, 1, 1, 1, 1, 1])
# 	=> [1, 1, 0, 1, 0, 0, 1]
def binary_integer_addition(b1, b2)
	r = []
	carry = 0
	(b1.length-1).downto(0).each { |i|
		if b1[i] + b2[i] == 0
			r << 0 + carry
			carry = 0
		elsif b1[i] + b2[i] == 1
			carry == 0 ? r << 1 : (r << 0; carry = 1)
		elsif b1[i] + b2[i] == 2
			carry == 0 ? r << 0 : r << 1
			carry = 1
		end
	}
	if carry == 1
		r << 1
	end
	r.reverse
end