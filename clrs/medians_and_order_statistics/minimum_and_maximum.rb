
# minimum in the array
def minimum(arr)
	# for empty input
	return nil if arr.nil? or arr.length == 0
	min = arr[0]
	arr.each do |elem|
		min = elem if elem < min
	end
	min
end

p minimum([])
p minimum([1, 5, 3, 2, 4, 2, 1, 5, 0, 2, 1, 0, -5])

# maximum in the array
def maximum(arr)
	# for empty input
	return nil if arr.nil? or arr.length == 0
	max = arr[0]
	arr.each do |elem|
		max = elem if elem > max
	end
	max
end


p maximum([])
p maximum([1, 5, 3, 2, 4, 2, 1, 5, 0, 2, 1, 0, -5])
