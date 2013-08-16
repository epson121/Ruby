##
# Testing class
# Usage: 
# 	d = C::M::N::D.new
# 	d.show_a
class C
	a = 5
	##
	# Testing module
	module M
		a = 4
		## 
		# Testing module
		module N
			a = 3
			##
			# Testing class
			class D
				a = 2
				## 
				# Testing method
				def show_a
					a = 1
					puts a
				end
				puts a
			end
			puts a
		end
		puts a
	end
	puts a
end

