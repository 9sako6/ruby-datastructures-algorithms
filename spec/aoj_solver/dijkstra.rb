require "./lib/priority_queue"
require "./lib/dijkstra"

Edge = Struct.new(:to, :cost)
v, e, r = gets.split.map(&:to_i)
g = Array.new(v) { [] }
e.times do |i|
  s, t, d = gets.split.map(&:to_i)
  g[s] << Edge.new(t, d)
end
puts dijkstra(g, r).map { |x| x == Float::INFINITY ? "INF" : x }