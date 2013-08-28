##
# Random search for a value in array
# Uses extra array to keep track of visited indexes
# Example:
# p random_search([1, 2, 3], 4)
# p random_search([1, 2, 3], 3)
# p random_search([13, 21, 33], 21)
#
def random_search(array, v)
	barray = Array.new(array.length, 0)
	c = 0
	while 1
		r = rand(array.length)
		return r if array[r] == v 
		barray[r] == 0 ? (barray[r] = 1; c += 1) : next
		return false if c == array.length
	end
end



