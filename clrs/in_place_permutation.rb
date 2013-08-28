##
# In place permutation of an array passed as parameter
# 
# Example:
#
# p permute([1, 2, 3, 4, 5]) => [2, 4, 3, 1, 5] or any other combination
#
def permute(array)
	for elem in 0..array.length-1
		random = rand(array.length)
		temp = array[elem]
		array[elem] = array[random]
		array[random] = temp
	end
	array
end

##
# Not an "in place" permutation of an array
# Example: 
# p permute_by_cycle([1, 2, 3, 4, 5]) => [4, 5, 1, 2, 3]
def permute_by_cycle(array)
	n = array.length
	offset = rand(n)
	barray = []
	for i in 0..n - 1
		dest = i + offset
		dest = dest - n if dest >= n
		barray[dest] = array[i]
	end
	barray
end





