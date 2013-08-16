p "Top level self: #{self}"
##
# Class for testing +self+ variable
# Usage:
# 	a = A.new
# 	A.hello
# 	a.hello
class A

	p "Class definition self: #{self}"
	##
	# +1+
	def self.hello
		p "Class method self: #{self}"
	end
	##
	# +2+
	def hello
		p "Instance method self: #{self}"
	end
end

