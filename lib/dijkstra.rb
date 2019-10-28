require "./lib/priority_queue"
#
# dijkstra
#   O(|E|log|V|)
#   隣接表現グラフgraph, 始点start, inf
#
def dijkstra(graph, start, inf = Float::INFINITY)
  vertex_num = graph.size
  que = PriorityQueue.new { |x, y| x[0] <= y[0] }
  dist = Array.new(vertex_num, inf)
  dist[start] = 0
  que.push([0, start])
  while !que.empty?
    d, v = que.pop
    next if dist[v] < d
    graph[v].size.times do |i|
      # e is an instance of Edge
      #   Edge = Struct.new(:to, :cost)
      e = graph[v][i]
      if dist[e.to] > dist[v] + e.cost
        dist[e.to] = dist[v] + e.cost
        que.push([dist[e.to], e.to])
      end
    end
  end
  return dist
end

__END__
Edge = Struct.new(:to, :cost)
v, e, r = gets.split.map(&:to_i)
g = Array.new(v) { [] }
e.times do |i|
  s, t, d = gets.split.map(&:to_i)
  g[s] << Edge.new(t, d)
end
puts dijkstra(g, r).map { |x| x == Float::INFINITY ? "INF" : x }

