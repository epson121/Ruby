# Graph ADT and Dijkstra Algorithm

Implementation of graph data structure and Dijkstras algorithm.


## How to Use

```ruby
=> create graph
a = Graph.new
=> add vertices
a.push(1, 2, 3, 4, 5, 6)
=> add connections between them
a.connect(1, 2, 1)
a.connect(1, 4, 3)
a.connect(2, 3, 2)
a.connect(4, 3, 4)
a.connect(1, 5, 2)
a.connect(5, 6, 2)
a.connect(5, 4, 3)
a.connect(4, 6, 3)
a.connect(3, 6, 5)
=> call dijkstra with source and destination vertices
p a.dijkstra(5, 3)
```

## What it does

It calculates shortest graph traversal from source to destination using Dijkstras algorithm. It does not allow parallel edges and negative edge lengths.
