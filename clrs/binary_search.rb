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
		bsearch(a, q+1, a.length-1, v)
	end
end

##
# function that calls bsearch with sorted array
# a -> array
# v -> value for searching
def binary_search(a, v)
	bsearch(merge_sort_array(a), 0, a.length, v)
end