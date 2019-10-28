def bellman_ford(vertex_num, start, edges, inf = Float::INFINITY)
  dist = Array.new(vertex_num, inf)
  dist[start] = 0
  vertex_num.times do |i|
    update = false
    edges.each do |e|
      if dist[e.to] > dist[e.from] + e.cost
        dist[e.to] = dist[e.from] + e.cost
        update = true
        dist[e.to] = -inf if i == vertex_num - 1
      end
    end
    break unless update
  end
  dist
end

__END__
Edge = Struct.new(:from, :to, :cost)
v, e, r = gets.split.map(&:to_i)
edges = []
e.times do
  s, t, d = gets.split.map(&:to_i)
  edges << Edge.new(s, t, d)
end
dist = bellman_ford(v, r, edges)
if dist.any? { |d| d == -Float::INFINITY }
  puts "NEGATIVE CYCLE"
else
  puts dist.map { |x| x == Float::INFINITY ? "INF" : x }
end
