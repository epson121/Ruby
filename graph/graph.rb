##
# Graph data structure class
# Example:
# a = Graph.new(10)
# a.addEdge(1, 2)
# p a.adj  => [[], [2], [], [], [], [], [], [], [], []]
# p a.e => 1
# p a.adjacent_to?(1, 2) => true
# p a.edges() => [[1, 2]]
# p a.vertices() => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# p a.edge?(1, 2) => true
# p a.edge?(2, 2) => false
# p a.each_edge(2) => []
# p a.each_edge(2) => [[1, 2]
#
class Graph
	## 
	# getter and setter for
	# v - number of vertices
	# e - number of edges
	# adj - array of adjacent vertices
	attr_accessor :v, :e, :adj

	#initialization with number of vertices
	def initialize(v)
		self.v = v -1
		self.e = 0
		self.adj = []
		v.times do 
			adj << []
		end
	end

	# edge addition
	def addEdge(v, w)
		if v < self.v and w < self.v
			if !adj[v].include?(w)
				adj[v] << w
			#if !adj[w].include?(v)
			#	adj[w] << v
				self.e += 1
			end
		end
	end

	# if exists edge between v and w
	def edge?(v, w)
		adj[v].include?(w) ? true : false
	end

	# print all vertices adjacent to v
	def adjacent_to(v)
		adj[v]
	end

	# if v is adjacent to w
	def adjacent_to?(v, w)
		adj[v].include?(w)
	end

	# degree of v vertice
	def degree(v)
		adj[v].length
	end

	# print all edges
	def edges()
		edges = []
		adj.each_with_index do |v, i|
			adj[i].each do |w|
				a = [i, w]
				edges << a
			end
		end
		edges
	end

	# print all edges od v vertice
	def each_edge(v)
		edges = []
		adj[v].each_with_index do |w, i|
			edges << [v, w]
		end
		edges
	end

	# print all vertices
	def vertices()
		(0..v).to_a
	end

end

a = Graph.new(10)
a.addEdge(1, 2)
a.addEdge(1, 2)
p a.adj
p a.e
p a.adjacent_to?(1, 2)

p a.edges()
p a.vertices()
p a.edge?(1, 2)
p a.edge?(2, 2)
p a.each_edge(2)
p a.each_edge(1)