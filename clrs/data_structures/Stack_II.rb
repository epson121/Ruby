class Stack
	attr_accessor :stack
	def initialize
		@stack = []
	end

	def push(data)
		@stack.push(data)
	end

	def pop()
		@stack.pop()
	end

	def print
		p @stack
	end

end

a = Stack.new()
a.push(1)
a.push(2)
a.push(3)
a.push(4)
a.print
p a.pop() == 4
p a.pop() == 3
a.pop()
a.pop()
p a.pop() == nil
a.print

