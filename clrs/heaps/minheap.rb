
require_relative 'heap'
##
# subclass of +Heap+ 
# Example:
# 	a = MinHeap.new([16, 4, 10, 3, 7])
#
# 	p a.minheap?
# 		=> false
# 	p a.heap
# 		=> [16, 4, 10, 3, 7]
# 	p a.minheapify(1)
# 		=> [16, 3, 10, 4, 7]
# 	p a.heapsort()
# 		=> [16, 10, 7, 4, 3]
#
class MinHeap < Heap

	##
	# initialization of min heap
	def initialize(heap)
		@min = lambda {|a, b| a < b}
		super
	end

	##
	# determines if it is a min heap
	def minheap?
		heaptype(@min, @heap)
	end

	##
	# Max heapify subtree starting at +i+ index
	def minheapify(i=0)
		n_heapify(@min, i)
		@heap
	end

	##
	# O(n) -> builds a minheap
	def build_minheap
		i = @heap.length/2
		while i >= 0
			minheapify(i)
			i -= 1
		end
	end

	#
	# used to heapsort an array
	def minheapify_heapsort(p, i = 0)
		n_heapify_heapsort(@min, i, p)
	end

	##
	# heapsort algorithm for sorting an array
	# O(n lg n)
	def heapsort()
		build_minheap()
		i = @heap.length-1
		while i >= 1
			temp = @heap[i]
			@heap[i] = @heap[0]
			@heap[0] = temp
			minheapify_heapsort(i)
			i -= 1
		end
		@heap
	end

end
