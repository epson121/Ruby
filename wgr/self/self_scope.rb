p "Top level self: #{self}"

class A

	p "Class definition self: #{self}"
	def self.hello
		p "Class method self: #{self}"
	end

	def hello
		p "Instance method self: #{self}"
	end
end

a = A.new
A.hello
a.hello

