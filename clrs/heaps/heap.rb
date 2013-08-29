##
# Base Heap class
class Heap
	##
	# heap array getter
	attr_accessor :heap

	##
	# initialization
	def initialize(heap)
		@heap = heap
	end

	##
	# get parent of +i+ indexed element
	def parent(i)
		i == 0 ? @heap[0] : @heap[((i-1)/2).ceil] 
	end
	
	##
	# get right child of +i+ indexed element
	def right(i)
		@heap[2*i + 2]
	end

	##
	# get left child of +i+ indexed element
	def left(i)
		@heap[2*i + 1]
	end

	##
	# get parent index of +i+ indexed element
	def parent_index(i)
		(i/2).ceil
	end

	##
	# get right child index of +i+ indexed element
	def right_index(i)
		2*i + 2
	end

	##
	# get left child index of +i+ indexed element
	def left_index(i)
		2*i + 1
	end

	##
	# get height of the heap
	def height
		## works only in ruby 2.0
		return Math.log2(@heap.length).ceil
	end

	##
	# get heap size
	def size
		@heap.length
	end

	##
	# let the value at @edge[i] "float down" in the 
	# max-heap/min-heap so that the subtree rooted at index 
	#i becomes a max-heap/min-heap
	def n_heapify(lam, i=0)
		l = left_index(i)
		r = right_index(i)
		size = self.size()
		temp = (l < size and lam.call(@heap[l],@heap[i])) ? l : i
		temp = r if (r < size and lam.call(@heap[r], @heap[temp]))
		if temp != i
			var = @heap[i]
			@heap[i] = @heap[temp]
			@heap[temp] = var
			n_heapify(lam, temp)
		end
		@heap
	end

	##
	# same as n_heapify, but keeps track of the index from which
	# the array is sorted (given as p in arguments)
	def n_heapify_heapsort(lam, p, i = 0)
		while size > 0
			l = left_index(i)
			r = right_index(i)
			temp = (l < p and lam.call(@heap[l],@heap[i])) ? l : i
			temp = r if (r < p and lam.call(@heap[r], @heap[temp]))
			if temp != i
				var = @heap[i]
				@heap[i] = @heap[temp]
				@heap[temp] = var
			end
			break if temp == i
			i = temp
			p -= 1
		end
		@heap
	end

	##
	# determines if heap is of MAX or MIN type
	def heaptype(lam, heap)
		p = 1
		while p < 2**height() do
			if !heap[p].nil?
				return false if lam.call(parent(p), heap[p])
				return false if lam.call(parent(p), heap[p])
			end
			p += 1
		end
		true
	end

end