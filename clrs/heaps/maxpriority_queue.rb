require_relative "heap"
##
#
# implementation of maximum priority queue
# using heap data structure
#  		pq = MaxPriorityQueue.new([1, 2, 3, 4, 5, 2, 12, 3])
#  		p pq.heap
#  		p pq.heap_extract_max()
#  		p pq.heap
#  		p pq.heap_incease_key(4, 10)
#  		p pq.max_heap_insert(5)
#  		p pq.max_heap_insert(6)
#  		p pq.max_heap_insert(9)
#  		p pq.max_heap_insert(11)
#  		p pq.max_heap_insert(10)
#  		pq.heap_delete(3)
#  		p pq.heap
#  		pq.heap_delete(2)
#  		p pq.heap
class MaxPriorityQueue < Heap

	##
	# initialization of the pq
	def initialize(array)
		@max = lambda {|a, b| a > b}
		super
		build_maxheap() if @heap.length > 0 and !heaptype(@max, @heap)
	end

	##
	# returns element with biggest key (root)
	def heap_maximum()
		@heap[0]
	end

	##
	# extracts (finds and deletes) the element with 
	# biggest key.
	def heap_extract_max()
		if @heap.length < 0
			return nil
		end
		max = @heap[0]
		@heap[0] = @heap[@heap.length-1]
		@heap.pop()
		n_heapify(@max)
		return max
	end

	##
	# O(n)
	# Builds a maxheap by heapifying from arr.length/2 -> 0
	def build_maxheap
		i = @heap.length/2
		while i >= 0
			n_heapify(@max, i)
			i -= 1
		end
	end

	##
	# changing the value of the +ith+ element
	def heap_incease_key(i, key)
		if @heap.length <= i
			return nil
		end 
		@heap[i] = key
		while i > 0 and parent(i) < @heap[i]
			temp = @heap[i]
			@heap[i] = parent(i)
			@heap[parent_index(i)] = temp
			i = parent_index(i)
		end
		@heap
	end

	##
	# inserting new element in pq
	def max_heap_insert(key)
		@heap.push(-1)
		heap_incease_key(@heap.length-1, key)
	end

	def heap_delete(i)
		last = @heap.length - 1
		temp = @heap[last] 
		@heap[last] = @heap[i]
		@heap[i] = temp
		@heap.pop()
		n_heapify(@max, i)
	end

end