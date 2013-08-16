##
# (a) Create a class Dessert with getters and setters for name and calories. Define instance
# methods healthy?, which returns true if a dessert has less than 200 calories, and delicious?,
# which returns true for all desserts.

class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	
	##
	#name getter
	def name
		@name
	end
	
	##
	#name setter
	def name=(new_name)
		@name = new_name
	end
	
	##
	#calories getter
	def calories
		@calories
	end
	
	##
	#calories setter
	def calories=(new_cal)
		@calories = new_cal
	end
	
	##
	# Healthy method
	def healthy?
		if @calories < 200
			return true
		end
		return false
	end

	##
	# delicious method -> kinda useless
	def delicious?
		return true
	end
end

##
# (b) Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify
# delicious? to return false if the flavor is black licorice (but delicious? should still return true for all
# other flavors and for all non-JellyBean desserts).

class JellyBean < Dessert
	##
	# Initialization method
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end
	##
	# flavor getter
	def flavor
		@flavor
	end
	##
	# flavor setter
	def flavor=(new_flavor)
		@flavor = new_flavor
	end
	##
	# delicious method
	def delicious?
		if @flavor == "black licorice"
			return false
		end
		return true
	end
end

##
# Usage:
# 
# 	z = Dessert.new("lol", "unlol")
# 	print z.name="lololo"
# 	print "\n"
# 	print z.name
