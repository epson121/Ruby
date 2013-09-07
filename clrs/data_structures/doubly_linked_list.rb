class Node
	attr_accessor :data, :next, :prev

	def initialize(data=nil)
		@data = data
	end
end

class DLList
	attr_accessor :root, :p, :length
	
	def initialize
		@root = Node.new()
		@p = @root
		@length = 0
	end

	def <<(data)
		n = Node.new(data)
		@p.next = n
		n.prev = @p
		@p = n
		@length += 1
	end

	def insert(data, index)
		n = Node.new(data)
		r = @root
		c = -1
		while c != index - 1
			r = r.next
			c += 1
		end
		n.next = r.next
		n.prev = r
		r.next = n
		@length += 1
	end

	def delete(index)
		return nil if @length == 0
		r = @root
		c = -1
		while c != index - 1
			r = r.next if r.next != nil
			c += 1
		end
		begin
			rv = r.next.data
			r.next = r.next.next
			r.next.prev = r
			@length -= 1
		rescue
			rv = nil
			r.next = nil
		end
		rv
	end

	def print
		return nil if @length == 0
		r = @root.next
		while !r.next.nil?
			puts r.data
			r = r.next
		end
		puts r.data
	end

	def print_reverse
		return nil if @length == 0
		r = @p
		while !r.prev.nil?
			puts r.data
			r = r.prev
		end
	end

end

a = DLList.new()
# p a.root.next

a << 1
a << 2
a << 3
a << 4
a << 5
a.print_reverse
p "--------------"
a.print

## not much testing was done, so it might be buggy