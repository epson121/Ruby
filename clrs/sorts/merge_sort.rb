##
# Implementation of the merge sort algorithms
# Examples:
# a = [4, 3, 2, 1, 6, 3, 2, 5, 3, 2]
# p merge_sort_array a
# 
# b = [6, 7, 3, 4, 2, 1, 5, 6, 8, 9, 6, 5, 4, 6, 7, 4, 0]
# p merge_sort_array b

##
# Infinity variable
INFINITY = +1.0/0.0

##
# auxiliary function for merging independent arrays into one array
# it is recursively called by +merge()+ method
# This implementation uses *sentinels*, that is, infinitely big values at the end of
# each independent array, so that the index would not go out of bounds
# a -> array
# p -> starting index for the merging
# q -> middle index for the merging
# w -> ending index for the merging
def merge_s(a, p, q, w)
	n1 = q - p + 1
	n2 = w - q
	l = []
	r = []
	for i in 0..n1 - 1
		l[i] = a[p + i]
	end
	for j in 0..n2 - 1
		r[j] = a[q + j + 1]
	end
	l << INFINITY
	r << INFINITY
	i, j = 0, 0
	for k in p..w
		if l[i] <= r[j]
			a[k] = l[i]
			i += 1
		else
			a[k] = r[j]
			j += 1
		end
	end
	a
end

##
# auxiliary function for merging independent arrays into one array
# it is recursively called by +merge()+ method
# This implementation does not use sentinels. It copies the rest f the values from
# another array when encounters the last digit from first one.
# a -> array
# p -> starting index for the merging
# q -> middle index for the merging
# w -> ending index for the merging
def merge(a, p, q, w)
	n1 = q - p + 1
	n2 = w - q
	l = []
	r = []
	for i in 0..n1 - 1
		l[i] = a[p + i]
	end
	for j in 0..n2 - 1
		r[j] = a[q + j + 1]
	end
	i, j = 0, 0
	for k in p..w
		if l[i] <= r[j]
			a[k] = l[i]
			i += 1
			if i == l.length
				a[k+1..w] = r[j..-1]
				break
			end
		else
			a[k] = r[j]
			j += 1
			if j == r.length
				a[k+1..w] = l[i..-1]
				break
			end
		end
	end
	a
end

##
# Recursive calling of itself and +merge+ method
# a -> array
# p -> starting index for sorting
# r -> ending index for sorting
def merge_sort(a, p, r)
	if p < r
		q = (p + r) / 2
		merge_sort(a, p, q)
		merge_sort(a, q + 1, r)
		merge(a, p, q, r)	
		#merge_s(a, p, q, r)	
	end
	a[p..r]
end

require 'insertion_sort'

def merge_sort_insertion(a, p, r, k)
	if p < r
		q = (p + r) / 2
		if (r - p) / 2 <= k
			left = sort_insertion(a[p..q])
			right = sort_insertion(a[q+1..r])
			a[p..r] = left + right
			merge(a, p, q, r)
			return a
		end
		merge_sort_insertion(a, p, q, k)
		merge_sort_insertion(a, q + 1, r, k)
		merge(a, p, q, r)	
	end
end

##
# function for sorting the entire array
# 2 types of sort
# +merge_sort+ -> full merge sort
# +merge_sort_insertion+ -> merge sort with insertion sort when 
# sub-arrays are of k length
# a -> array
# example:
# 	b = [6, 7, 3, 4, 2, 1, 5, 6, 8, 9, 6, 5, 4, 6, 7, 4, 0, 8]
# 	a = [1, 3, 5, 4, 2]
# 	c = [6, 7, 3, 4, 2, 1, 5, 6, 8, 9, 6, 5, 4, 6, 7, 4, 0, 8, 34, 23, 56, 12, 45, 67, 3, 4, 5,2,2,1,2,3,4,5,6,4,3,2,2,0, 123]
# 	p merge_sort_array b
# 	p merge_sort_array a
#  	p merge_sort_array c
#
def merge_sort_array(a)
	k = 4
	#merge_sort(a, 0, a.length-1)
	merge_sort_insertion(a, 0, a.length - 1, k)
end