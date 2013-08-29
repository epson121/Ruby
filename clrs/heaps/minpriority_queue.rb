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
		build_minheap() if !heaptype(@min, @heap)
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

	def min_heap_insert(key)
		@heap.push(-1)
		heap_incease_key(@heap.length-1, key)
	end

end


