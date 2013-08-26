##
#

## For ruby 2.0 require_relative is needed
#require 'edge'
require_relative 'edge'

class Graph < Array
	
	attr_accessor :e

	# I couldnt get Infinity to work so this is kind of a
	# workaround -.-
	$inf = 100000000000000;

	#initialization with no edges
	def initialize
		@e = []
	end

	# adding vertices
	def <<(a)
		if !self.include? a
			self.push(a)
		else
			return nil
		end
		true
	end

	##
	# connecting two vertices (+src+ and +dest+ with length +len+)
	def connect(src, dest, len = 1)
		if self.include?(src) and self.include?(dest) and !edge_exists?(src, dest)
				@e << Edge.new(src, dest, len)
		else
			return nil
		end
		true
	end

	##
	# Mutual connection (v1 -> v2 and v2 -> v1 with len)
	def connect_mutually(v1, v2, len=1)
		connect(v1, v2, len)
		connect(v2, v1, len)
	end

	##
	# Verify if exists edge between +src+ and +dest+
	def edge_exists?(src, dest)
		return false if @e.empty?
		@e.each do |edge|
			if edge.src == src and edge.dest == dest
				return true
			end
		end
		false
	end

	##
	# get length from +src+ and +dest+ vertices
	def length_between(src, dest)
		@e.each do |edge|
			if edge.src == src and edge.dest == dest
				return edge.len
			end
		end
		nil
	end

	##
	# Get all neighbours of +e+ edge
	def neighbours(e)
		neighbours = []
		@e.each do |edge|
			neighbours << edge.dest if edge.src == e
		end
		neighbours
	end

	##
	# Auxiliary method that gets the smallest +value+
	# from +hash+, including only elements of +hash+ that
	# have the +key+ in +q+ array
	def smallest_key(q, hash)
		temp = {}
		q.each do |v|
			temp[v] = hash[v]
		end
		return temp.key(temp.each_value.min)
	end

	##
	# Dijkstra algorithm from +src+ to +dest+
	def dijkstra(src, dest)
		distances = {}
		previous = {}

		# set all values to infinity
		self.each do |vertex|
			distances[vertex] = $inf
			previous[vertex] = $inf
		end

		# set the source vertice to 0
		distances[src] = 0
		q = self.clone

		while !q.empty?
			# get the nearest vertice
			u = smallest_key(q, distances)
			break if distances[u] == $inf

			# if smallest is destination, return 
			if u == dest
				return distances[dest] 
			end
			
			# iterate all neighbours of the nearest vertice				
			neighbours(u).each do |v|
				# calculate distances from neighbour nodes
				# and add cumulated distance
				alt = distances[u] + length_between(u, v)
				# update vertice distances accordingly
				if alt < distances[v]
					distances[v] = alt
					previous[q] = u
				end
			end
			# delete vertice from array
			q.delete(u)
		end
		distances
	end

end
 

a = Graph.new
a.push(1, 2, 3, 4, 5, 6)
# a.connect(1, 2, 1)
# a.connect(1, 4, 3)
# a.connect(2, 3, 2)
# a.connect(4, 3, 4)
# a.connect(1, 5, 2)
# a.connect(5, 6, 2)
# a.connect(5, 4, 3)
# a.connect(4, 6, 3)
# a.connect(3, 6, 5)
a.connect_mutually(1, 2, 1)
a.connect_mutually(1, 4, 3)
a.connect_mutually(2, 3, 2)
a.connect_mutually(4, 3, 1)
a.connect_mutually(1, 5, 2)
a.connect_mutually(5, 6, 2)
a.connect_mutually(5, 4, 3)
a.connect_mutually(4, 6, 3)
a.connect_mutually(3, 6, 5)

p a.dijkstra(5, 3)
