require_relative "heap"

##
# implementation of minimum priority queue
# using heap data structure
# Example:
#  	   pq = MinPriorityQueue.new([1, 2, 3, 4, 5, 2, 12, 3])

#  	   p pq.heap
#  	   p pq.heap_extract_min()
#  	   p pq.heap
#  	   p pq.heap_incease_key(4, 10)
#  	   p pq.min_heap_insert(6)
#  	   p pq.min_heap_insert(5)
#  	   p pq.min_heap_insert(9)
#  	   p pq.min_heap_insert(11)
#  	   p pq.min_heap_insert(10)
#
class MinPriorityQueue < Heap

	##
	# initialization of the pq
	def initialize(array)
		@min = lambda {|a, b| a < b}
		super
		build_minheap() if @heap.length > 0 and !heaptype(@min, @heap)
	end

	##
	# returns element with biggest key (root)
	def heap_minimum()
		@heap[0]
	end

	##
	# extracts (finds and deletes) the element with 
	# biggest key.
	def heap_extract_min()
		if @heap.length < 0
			return nil
		end
		min = @heap[0]
		@heap[0] = @heap[@heap.length-1]
		@heap.pop()
		n_heapify(@min)
		return min
	end

	##
	# O(n) -> builds a minheap
	def build_minheap
		i = @heap.length/2
		while i >= 0
			n_heapify(@min, i)
			i -= 1
		end
	end

	##
	# change the value of element at
	# position i and maintain min priority queue
	def heap_incease_key(i, key)
		if @heap.length <= i
			return nil
		end 
		@heap[i] = key
		while i > 0 and parent(i) > @heap[i]
			temp = @heap[i]
			@heap[i] = parent(i)
			@heap[parent_index(i)] = temp
			i = parent_index(i)
		end
		@heap
	end

	##
	# insert new element in heap (queue)
	def min_heap_insert(key)
		@heap.push(-1)
		heap_incease_key(@heap.length-1, key)
	end

	##
	# delete element at index +i+ from queue
	def heap_delete(i)
		last = @heap.length - 1
		temp = @heap[last] 
		@heap[last] = @heap[i]
		@heap[i] = temp
		@heap.pop()
		n_heapify(@min, i)
	end

end


	##
	# Give an O(n lg k)-time algorithm to merge k sorted lists into one sorted list, where n is the
	# total number of elements in all the input lists. 
	# (Hint: Use a min-heap for k-way merging.)

	# def merge_k_presorted_lists(*a)
	# 		len = a.length - 1
	# 		res = []
	# 		temp = MinPriorityQueue.new([])
	# 		min = 0
	# 		#loop
	# 		for i in 0..len
	# 			temp.min_heap_insert(a[i][0])
	# 			min = i if a[i][0] < a[min][0]
	# 			a[i].delete_at(0)
	# 		end

	# 		res << temp.heap_extract_min()
	# 		temp.min_heap_insert(a[min][0])
	# end




# p merge_k_presorted_lists([1, 2, 3, 4], 
# 													[1, 5, 6, 9], 
# 													[2, 8, 10, 12, 13])