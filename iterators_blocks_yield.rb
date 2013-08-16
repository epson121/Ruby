#30.07.2012. Luka Rajcevic

##
# Examples of use
# c = CartesianProduct.new([:a,:b], [4,5])
# c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
 
# c = CartesianProduct.new([:a,:b], [:c, :d, :e])
# c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty
class CartesianProduct
	include Enumerable
	##
	# Initialization
	def initialize(a1, a2)
		@a1 = a1;
		@a2 = a2;
	end

	##
	# each method
	def each
		@a1.each do |elem|
			j = 0;
			while j < @a2.length
				arr = []
				arr << elem
				arr << @a2[j];
				yield arr
				j +=1;
			end
		end
     end
end
 
)
