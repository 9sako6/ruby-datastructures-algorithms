class FordFulkerson
  class Edge
    attr_accessor :to, :cap, :rev
    def initialize(to, cap, rev)
      @to, @cap, @rev = to, cap, rev
    end
  end

  def initialize(n)
    @N = n
    @g = Array.new(n) {[]} # 隣接リスト表現
    @used = Array.new(n) # dfsですでに調べたかのフラグ
  end
  
  def add_edge(from, to, cap)
    @g[from] << Edge.new(to, cap, @g[to].size)
    @g[to] << Edge.new(from, 0, @g[from].size-1)
  end

  def dfs(v, t, f) # v: 調べる始点, t: 終点, f:
    return f if v == t
    @used[v] = true
    @g[v].size.times do |i| # vから行ける各点について
      edge = @g[v][i] # vから伸びてるある辺
      if !@used[edge.to] && edge.cap > 0
        d = dfs(edge.to, t, [f, edge.cap].min)
        if d > 0
          edge.cap -= d # d流す（残容量をd減らす）
          @g[edge.to][edge.rev].cap += d
          return d
        end
      end
    end
    return 0
  end

  def max_flow(s, t)
    flow = 0
    while true
      @used = Array.new(@N)
      f = dfs(s, t, 10**10) # inf
      return flow if f == 0
      flow += f
    end
  end
end

__END__
V, E = gets.split.map(&:to_i)
nw = FordFulkerson.new(V)
E.times do
  a,b,c = gets.split.map(&:to_i)
  nw.add_edge(a, b, c)
end
puts nw.max_flow(0, V-1)