require "./lib/edmonds_karp"

vn, en = gets.split.map(&:to_i)
g = EdmondsKarp.new(vn)

en.times do |i|
  s, t, w = gets.split.map(&:to_i)
  g.add_edge(s, t, w)
end

puts g.max_flow(0, vn - 1)