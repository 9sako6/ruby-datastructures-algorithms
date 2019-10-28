require "./lib/ford_fulkerson"

V, E = gets.split.map(&:to_i)
nw = FordFulkerson.new(V)
E.times do
  a,b,c = gets.split.map(&:to_i)
  nw.add_edge(a, b, c)
end
puts nw.max_flow(0, V-1)