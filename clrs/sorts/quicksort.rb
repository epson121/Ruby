## lambda objects for descending / ascending order
asc = lambda {|a,b| a <= b}
desc = lambda {|a,b| a >= b}

##
# partitions the array into smaller than pivot
# and greater than pivot, with pivot being the last 
# element, and then swapped to middle, before return
def partition(arr, p, r, ord)
	# for empty array
	return [] if r < 0
	x = arr[r]
	i = p - 1
	j = p
	for j in p..r-1
		# USE OF LAMBDA FROM ABOVE
		if ord.call(arr[j], x)
			i += 1
			temp = arr[i]
			arr[i] = arr[j]
			arr[j] = temp
		end
	end
	temp = arr[i+1]
	arr[i+1] = arr[r]
	arr[r] = temp
	return i + 1
end

## all values are smaller than the pivot so
# the array remains unchanged
a = [19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
p partition(a, 0, a.length-1, asc)

## call partition for equal values
b = [1, 1, 1, 1, 1, 1, 1, 1]
p partition(b, 0, b.length-1, asc)

##
# quicksort algorithm, partitions array recursively
# returns sorted array either desc or asc
# worst case O(n2), like insertion sort
# best case =(nlogn), like merge sort
def quicksort(arr, p, r, ord)
	if p < r
		q = partition(arr, p, r, ord)
		quicksort(arr, p, q - 1, ord)
		quicksort(arr, q + 1, r, ord)
	end
	arr
end

arr = [19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
p quicksort(arr, 0, arr.length-1, asc)
p quicksort(arr, 0, arr.length-1, desc)
c = []
p quicksort(c, 0, c.length-1, asc)

## Randomized version of quicksort
# using random sampling
# only difference is that random element is used as pivot
# and set to last place in array. Everything else is the same.
def randomized_partition(arr, p, r, ord)
	i = rand(p...r)
	temp = arr[i]
	arr[i] = arr[r]
	arr[r] = temp
	partition(arr, p, r, ord)
end

def randomized_quicksort(arr, p, r, ord)
	if p < r
		q = randomized_partition(arr, p, r, ord)
		randomized_quicksort(arr, p, q-1, ord)
		randomized_quicksort(arr, q + 1, r, ord)
	end
	arr
end

arrr = [19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
p randomized_quicksort(arrr, 0, arrr.length-1, asc)
p randomized_quicksort(arrr, 0, arrr.length-1, desc)
c = []
p quicksort(c, 0, c.length-1, desc)


## quicksort using tail recursion
def quicksort_tail_recusion(arr, p, r, ord)
	while p < r
		q = partition(arr, p, r, ord)
		quicksort_tail_recusion(arr, p, q - 1, ord)
		p = q + 1
	end
	arr
end

ar = [19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
p quicksort_tail_recusion(ar, 0, ar.length-1, asc)
p quicksort_tail_recusion(ar, 0, ar.length-1, desc)