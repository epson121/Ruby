##
# Methods for insertion sort
# given an a, it sorts it
# usage:
# 	sort_indestion([a]) => sorted a
# example:
# 	p sort_insertion([5, 4, 3, 2, 1, 4]) => [1, 2, 3, 4, 4, 5]
# 	p sort_insertion_reverse([5, 4, 3, 2, 1, 4]) => [5, 4, 4, 3, 2, 1]

##
# Ascending insertion sort
def sort_insertion(a)
	for j in 1..(a.length - 1)
		key = a[j]
		i = j - 1
		while i >= 0 and a[i] > key
			temp  = a[i+1]
			a[i+1] = a[i]
			a[i] = temp
			i -= 1
		end
		a[i+1] = key
	end
	a
end

##
# Descending insertion sort
def sort_insertion_reverse(a)
	for j in 1..(a.length - 1)
		key = a[j]
		i = j - 1
		while i >= 0 and a[i] < key
			temp = a[i+1]
			a[i+1] = a[i]
			a[i] = temp
			i -= 1
		end
		a[i+1] = key
	end
	a
end


#sort_insertion([5, 4, 3, 2, 1, 4])
#sort_insertion([5, 3, 2, 5, 3, 5, 6, 7, 8, 4, 3, 2, 12, 23, 1, 123, 4545, 3543554])

p sort_insertion_reverse([5, 4, 3, 2, 1, 4])
#sort_insertion_reverse([5, 3, 2, 5, 3, 5, 6, 7, 8, 4, 3, 2, 12, 23, 1, 123, 4545, 3543554])