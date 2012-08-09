=begin
(a) Create a class Dessert with getters and setters for name and calories. Define instance
methods healthy?, which returns true if a dessert has less than 200 calories, and delicious?,
which returns true for all desserts.
(b) Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify
delicious? to return false if the flavor is black licorice (but delicious? should still return true for all
other flavors and for all non-JellyBean desserts).
=end

class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	#name getter
	def name
		@name
	end
	#name setter
	def name=(new_name)
		@name = new_name
	end
	#calories getter
	def calories
		@calories
	end
	#calories setter
	def calories=(new_cal)
		@calories = new_cal
	end
	def healthy?
		if @calories < 200
			return true
		end
		return false
	end
	def delicious?
		return true
	end
end
class JellyBean < Dessert
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end
	def flavor
		@flavor
	end
	def flavor=(new_flavor)
		@flavor = new_flavor
	end
	def delicious?
		if @flavor == "black licorice"
			return false
		end
		return true
	end
end

z = Dessert.new("lol", "unlol")
print z.name="lololo"
print "\n"
print z.name
