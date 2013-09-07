require 'singly_linked_list'

class Queue
	attr_accessor :queue

	def initialize
		@queue = SLList.new
	end

	def enqueue(data)
		@queue << data
	end

	def dequeue()
		@queue.delete(0)
	end

	def length
		@queue.length
	end

	def print
		@queue.print
	end

end

a = Queue.new()
a.enqueue(1)
a.enqueue(2)
a.enqueue(3)
a.enqueue(4)
#p a.length

a.print
p "---------"
a.dequeue()
a.print
a.dequeue()
a.dequeue()
a.dequeue()
a.dequeue()
p "---------"
a.print