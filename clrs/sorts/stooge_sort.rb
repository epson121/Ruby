# wikipedia:
# Stooge sort is a recursive sorting algorithm with 
# a time complexity of O(nlog 3 / log 1.5 ) = O(n2.7095...). 
# The running time of the algorithm is thus extremely slow 
# compared to efficient sorting algorithms, such as Merge sort,
# and is even slower than Bubble sort, a canonical example of a
# fairly inefficient and simple sort
def stooge_sort(arr, i, j)
	return [] if j < 0 
	if arr[i]  > arr[j]
		temp = arr[i]
		arr[i] = arr[j]
		arr[j] = temp
	end
	return if (i + 1) >= j
	k = ((j - i + 1) / 3.0).ceil
	stooge_sort(arr, i, j - k)
	stooge_sort(arr, i + k, j)
	stooge_sort(arr, i, j - k)
	arr
end

a = [2, 3, 1]
p stooge_sort(a, 0, a.length - 1)