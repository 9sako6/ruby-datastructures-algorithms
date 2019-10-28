require "./lib/warshall_floyd.rb"

v, e = gets.split.map(&:to_i)
d = Array.new(v) { Array.new(v, Float::INFINITY) }
v.times { |i| d[i][i] = 0 }
edges = []
e.times do
  s, t, c = gets.split.map(&:to_i)
  d[s][t] = c
  edges << [s, t, c]
  # d[t][s] = c
end
res = warshall_floyd(d)
v.times do |i|
  edges.each do |edge|
    if res[i][edge[0]] + edge[2] < res[i][edge[1]]
      puts "NEGATIVE CYCLE"
      exit
    end
  end
end
res.each do |row|
  puts row.map{|x| x == Float::INFINITY ? "INF" : x} * " "
end