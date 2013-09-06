##
# arr - array to sort
# k - every element is no larger than k
def counting_sort(arr, k)
	# auxiliary array
	c = []
	# resulting array
	b = []
	# set all in aux to 0
	for i in 0..k
		c[i] = 0
	end
	# get count of each number
	arr.each do |i|
		c[i] += 1
	end
	# get number of smaller or equal to number at i index
	# by keeping a sum
	for i in 1..k
		c[i] = c[i] + c[i-1]
	end
	# sort
	j = arr.length-1
	while j >= 0
		b[c[arr[j]]-1] = arr[j]
		c[arr[j]] -= 1
		j -= 1
	end
	b
end

a = [2, 3, 1, 0, 3, 4, 5, 2, 1, 2, 3, 4, 5, 3, 4]
p counting_sort(a, 5)