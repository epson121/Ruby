class Queue
	attr_accessor :queue
	def initialize
		@queue = []
	end

	def enqueue(data)
		@queue.unshift(data)
	end

	def dequeue
		@queue.pop()
	end

	def print
		p @queue
	end
end

a = Queue.new()
a.print
a.enqueue(1)
a.enqueue(2)
a.enqueue(3)
a.enqueue(4)
a.enqueue(5)
a.print
p a.dequeue()
a.print