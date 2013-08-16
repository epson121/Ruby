## 
# Infinite list *IL* module 
module IL
	##
	# *Node* class that represents one element in list
	class Node
		##
		# Initialization method *Node#initialize* represents +value+ , +next+ and +prev+ value / lambdas
		def initialize(number)
			@value = number
			@next = lambda {Node.new(number + 1)}
			@prev = lambda {Node.new(number - 1)}
		end

		##
		# *getter* for the +value+ attribute
		attr_reader :value

		##
		# call to *next*
		def next
			@next.call
		end

		##
		# call to *prev*
		def prev
			@prev.call
		end

	end
end

elem = IL::Node.new(10)

20.times do 
	p elem.value
	elem = elem.next
end

elem = IL::Node.new(10)
20.times do
	p elem.value
	elem = elem.prev
end	