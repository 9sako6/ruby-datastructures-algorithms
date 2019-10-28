require "./lib/bellman_ford"

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
