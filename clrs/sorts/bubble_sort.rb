##
# Implementation of bubble sort algorithm
# a -> array
# Example:
# 	a = [1, 2, 5, 3, 2, 6, 4, 2]
# 	p bubble_sort(a)
#
# 	b = [4, 1, 2, 5, 3, 3, 21, 34, 23, 45, 123, 5, 4, 2, 12, 2, 6, 4, 2]
# 	p bubble_sort(b)

def bubble_sort(a)
	for i in 0..a.length - 1
		(a.length-1).downto(i + 1) do |j|
			if a[j] < a[j-1]
				temp = a[j]
				a[j] = a[j-1]
				a[j-1] = temp
			end
		end
	end
	a
end
