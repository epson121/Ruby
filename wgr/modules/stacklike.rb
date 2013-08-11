module Stacklike

	def initialize
		@stack ||= []
	end

	def print
		@stack
	end

	def push_to_stack elem
		@stack.push elem
	end

	def pop_from_stack
		@stack.pop
	end
end