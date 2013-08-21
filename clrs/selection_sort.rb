##
# selection sort algorithm.
# given an array of numbers, it sorts them in ascending order
# examples:
# 	p selection_sort([3, 2, 1])
# 	p selection_sort([3, 2, 4, 7, 2, 5, 1])
# 	p selection_sort([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
# 	p selection_sort([1.2, 3.4, 6.3, 1.8, 1.96])

def selection_sort(a)
	for i in 0..a.length-2
		min = i
		for j in  (i+1..a.length-1)
			if a[j] < a[min]
				min = j
			end
		end
		temp = a[i]
		a[i] = a[min]
		a[min] = temp
	end
	a
end