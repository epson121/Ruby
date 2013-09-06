require "insertion_sort.rb"

## O(n) algorithm for sorting numbers
# in [0, 1> range
def bucket_sort(arr)
	n = arr.length - 1
	b = []
	(n+1).times {b << []}
	for i in 0..n
		b[n*arr[i]] << arr[i]
	end
	for i in 0..n
		sort_insertion(b[i])
	end
	b.inject(:+)
end

p bucket_sort([0.1, 0.47, 0.3, 0.26, 0.41, 0.86, 0.43, 0.71, 0.84, 0.5])