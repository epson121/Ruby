##
# Binary sort algorithm
# Given an array +a+ and a value +v+ it recursively scans through the array
# if value is found, +true+ is returned, else +nil+
# it requires merge sort methods from merge_sort.rb in the same repository
# Example:
# 	a = [1, 2, 3, 4, 3, 9, 8]
# 	p binary_search(a, 12) => nil
#   p binary_search(a, 8)  => true
require 'merge_sort'

##
# function that recursively calls itself and solves binary search
# a -> array
# p -> starting index for searching
# q -> ending index for searching
# v -> value for searching
def bsearch(a, p, q, v)
	q = (q + p) / 2
	if a[q] == v
		return true
	elsif p == q
		return nil
	elsif a[q] > v
		bsearch(a, p, q, v)
	elsif a[q] < v
		bsearch(a, q+1, a.length, v)
	end
end

##
# function that calls bsearch with sorted array
# a -> array
# v -> value for searching
def binary_search(a, v)
	bsearch(merge_sort_array(a), 0, a.length, v)
end


##
# Given an array +s+ and a value +x+,
# find whether exist 2 numbers in array +s+ that, 
# when added together, give +x+.
# Solved using binary search
# Example:
# 	a = [1, 3, 4, 5]
# 	p sum_exists(a, 4) => true
# 	p sum_exists(a, 10) =>  false
def sum_exists(s, x)
	# Sort the given array
	s = merge_sort_array(s)
	# Loop through the elements
	for a in 0..s.length - 1
		# if in the part of array that is 1 from right of the +a+
		# exists a number whose value is +x - s[a]+, return true
	    b = binary_search(s[a+1..s.length], x - s[a])
	    if !b.nil?
	        return true
	    end
	end
	# if none found, return false
	return false
end