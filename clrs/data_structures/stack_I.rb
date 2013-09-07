require 'singly_linked_list'

class Stack
	attr_accessor :stack

	def initialize
		@stack = SLList.new
	end

	def push(data)
		@stack << data
	end

	def pop()
		@stack.delete(@stack.length-1)
	end

	def length
		@stack.length
	end

	def print
		@stack.print
	end

end

a = Stack.new()
a.push(1)
a.push(2)
a.push(3)
a.push(4)
#p a.lengt
p a.pop()
p a.pop()
p a.pop()
p a.pop()
p a.pop()
p a.pop()
a.print