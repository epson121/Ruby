## 
# Class variable scope
# Usage: 
# 	Car.add_make("Honda")
# 	Car.add_make("Ford")
# 	h = Car.new("Honda")
# 	f = Car.new("Ford")
# 	h2 = Car.new("Honda")
#
# 	puts "Counting cars of same make as h2..."
# 	puts "There are #{h2.make_mates}."

# 	puts "Counting total cars..."
# 	puts "There are #{Car.total_count}."

##
# Constant X
x = Car.new("Brand X")

class Car
	@@makes = []
	@@cars = {}
	@@total_count = 0
	
	##
	# Getter for +make+
	attr_reader :make
	
	##
	# getter for +total_count+
	def self.total_count
		@@total_count
	end
	
	## 
	# Method for addind a +make+ to +@makes+ array
	def self.add_make(make)
		unless @@makes.include?(make)
			@@makes << make
			@@cars[make] = 0
		end
	end

	##
	# Initialization method
	def initialize(make)
		if @@makes.include?(make)
			puts "Creating a new #{make}!"
			@make = make
			@@cars[make] += 1
			@@total_count += 1
		else
			raise "No such make: #{make}."
		end
	end

	##
	# Makes mates, adds them to +@@cars+ array
	def make_mates
		@@cars[self.make]
	end
end
