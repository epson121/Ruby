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

##
# function for sorting the entire array
# a -> array
def merge_sort_array(a)
	merge_sort(a, 0, a.length - 1)
end


