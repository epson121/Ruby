class Edge
	attr_accessor :src, :dest, :len

	def initialize(src, dest, len = 1)
		@src = src
		@dest = dest
		@len = len
	end

end
