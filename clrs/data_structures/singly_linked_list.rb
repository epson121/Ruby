class Node
	attr_accessor :data, :next

	def initialize(data=nil)
		@data = data
	end
end

class SLList
	attr_accessor :root, :p, :length
	
	def initialize
		@root = Node.new()
		@p = @root
		@length = 0
	end

	def <<(data)
		n = Node.new(data)
		@p.next = n
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

end

# a = SLList.new()
# # p a.root.next

# a << 1
# a << 2
# a << 3
# a << 4
# a << 5
# a.insert(6, 0)
# p "l " + a.length.to_s
# a.delete(0)
# a.delete(6)
# a.print

## not much testing was done, so it might be buggy