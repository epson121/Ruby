require "stacklike"
class Stack
	include Stacklike
end

a = Stack.new()

p a.push_to_stack 1
p a.push_to_stack 2
p a.push_to_stack 3

p a.print

p a.pop_from_stack
