require_relative 'heap'

##
# Subclass of Heap
# represents Max type of heap
#
# Example:
# 	k = MaxHeap.new([-1, 1, -34])
# 	l = MaxHeap.new([4, 1, 3, 2, 16, 9, 10, 14, 8, 7])
#
# 	p k.heap 
#  		=> [-1, 1, -34]
# 	p k.heapsort() 
# 		=> [-34, -1, 1]
# 	p l.heap 
# 		=> [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
# 	p l.heapsort() 
# 		=> [1, 2, 3, 4, 7, 8, 9, 10, 14, 16]
class MaxHeap < Heap

	##
	# initialization
	def initialize(heap)
		@max = lambda {|a, b| a > b}
		super
	end

	## 
	# determines if heap is max
	def maxheap?
		heaptype(@max, @heap)
	end

	##
	# Max heapify subtree starting at +i+ index
	def maxheapify(i = 0)
		n_heapify(@max, i)
	end

	##
	# used to heapsort an array
	def maxheapify_heapsort(p, i = 0)
		n_heapify_heapsort(@max, i, p)
	end

	##
	# O(n)
	# Builds a maxheap by heapifying from arr.length/2 -> 0
	def build_maxheap
		i = @heap.length/2
		while i >= 0
			maxheapify(i)
			i -= 1
		end
	end

	##
	# heapsort algorithm for sorting an array
	# O(n lg n)
	def heapsort()
		build_maxheap()
		i = @heap.length-1
		while i >= 1
			temp = @heap[i]
			@heap[i] = @heap[0]
			@heap[0] = temp
			maxheapify_heapsort(i)
			i -= 1
		end
		@heap
	end

end
