##
# Metaprogrammed +Integer+ class
# Usage:
# 	a = 0
# 	5.mtimes {p a; a += 1}
#
class Integer
	##
	# +times+ method reimplemented
	def mtimes
		c = 0
		while c < self
			yield
			c += 1
		end
	end
end

