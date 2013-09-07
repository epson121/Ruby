# ruby 2.0
##
# partitions the array into smaller than pivot
# and greater than pivot, with pivot being the last 
# element, and then swapped to middle, before return
def partition(arr, p, r)
	# for empty array
	return [] if r < 0
	x = arr[r]
	i = p - 1
	j = p
	for j in p..r-1
		if arr[j] <= x
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

## Randomized version of quicksort
# using random sampling
# only difference is that random element is used as pivot
# and set to last place in array. Everything else is the same.
def randomized_partition(arr, p, r)
	i = rand(p..r)
	temp = arr[i]
	arr[i] = arr[r]
	arr[r] = temp
	partition(arr, p, r)
end

##
# returns the +ith+ smallest element from array
# recursive version
def randomized_select(arr, p, r, i)
	return nil if i > arr.length
	return arr[p] if p == r
	q = randomized_partition(arr, p, r)
	k = q - p + 1
	if i == k
		return arr[q]
	elsif i < k
		return randomized_select(arr, p, q - 1, i)
	else
		return randomized_select(arr, q + 1, r, i-k)
	end
end

##
# returns the +ith+ smallest element from array
# iterative version, worst case O(n^2)
def randomized_select_iter(arr, p, r, i)
	return nil if i > arr.length
	while true do 
		return arr[p] if p == r
		q = randomized_partition(arr, p, r)
		k = q - p + 1
		if i == k
			return arr[q]
		elsif i < k
			r = q - 1
		else
			p = q + 1
			i -= k
		end
	end
end

a = [4, 2, 1, 3, 2, 5, 6, 4, 3, 2, 1, 2, 29, 45, 56, 67, 34, 23, 12, 45, 34, 11]
#p randomized_partition(a, 0, a.length-1)
p randomized_select(a, 0, a.length-1, 12)
p randomized_select_iter(a, 0, a.length-1, 12)
b = [3, 2, 9, 0, 7, 5, 4, 8, 6, 1]
p randomized_select(b, 0, b.length - 1, 1)
p randomized_select(b, 0, b.length - 1, 1)