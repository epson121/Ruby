##
# Stacklike module that gives classes ability of stacking
module Stacklike

	##
	# initialization
	def initialize
		@stack ||= []
	end
	
	##
	# Printing
	def print
		@stack
	end

	##
	# Push to stack
	def push_to_stack elem
		@stack.push elem
	end

	##
	# Pop from stack
	def pop_from_stack
		@stack.pop
	end
end