def warshall_floyd(dist)
  # dist: 隣接行列
  #   dist[u][v]はe=(u, v)のコスト(dist[i][i] = 0, 存在しない場合はINF)
  res = dist.dup
  vertex_num = res.size
  vertex_num.times do |k|
    vertex_num.times do |i|
      vertex_num.times do |j|
        res[i][j] = [res[i][j], res[i][k] + res[k][j]].min
      end
    end
  end
  res
end

__END__
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
