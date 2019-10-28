require "./lib/dinic"
v, e = gets.split.map(&:to_i)
g = Dinic.new(v)

e.times do |i|
  s, t, w = gets.split.map(&:to_i)
  g.add_edge(s, t, w)
end

puts g.max_flow(0, v-1)