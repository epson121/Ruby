

##
# let the value at @edge[i] "float down" in the 
# max-heap/min-heap so that the subtree rooted at index 
#i becomes a max-heap/min-heap
def n_heapify(lam, heap, i=0)
	l = left_index(i)
	r = right_index(i)
	size = heap.length
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

p 