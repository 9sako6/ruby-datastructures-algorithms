# 
# https://onlinejudge.u-aizu.ac.jp/problems/GRL_6_A
# 

class Dinic
  def initialize(v, inf = 2**30)
    @V = v
    @inf = inf
    @g = Array.new(v) {[]}
    @level = Array.new(v, 0)
    @iter = Array.new(v, 0)
  end
  attr_accessor :g

  def add_edge(from, to, cap)
    @g[from] << {"to" => to, "cap" => cap, "rev" => @g[to].size}
    @g[to] << {"to" => from, "cap" => 0, "rev" => @g[from].size-1}
  end

  def bfs(s) # sからの最短距離をbfs
    @level = Array.new(@V, -1)
    @level[s] = 0
    q = [s]
    while !q.empty?
      v = q.shift
      @g[v].size.times do |i|
        e = @g[v][i]
        if e["cap"] > 0 && @level[e["to"]] < 0
          @level[e["to"]] = @level[v] + 1
          q << e["to"]
        end
      end
    end
  end

  def dfs(v, t, f)
    return f if v == t
    (@iter[v]...@g[v].size).each do |i|
      @iter[v] = i
      e = @g[v][i]
      if e["cap"] > 0 && @level[v] < @level[e["to"]]
        d = dfs(e["to"], t, [f, e["cap"]].min)
        if d > 0
          e["cap"] -= d
          @g[e["to"]][e["rev"]]["cap"] += d
          return d
        end
      end
    end
    return 0
  end

  def max_flow(s, t)
    flow = 0
    while true
      bfs(s)
      return flow if @level[t] < 0
      @iter = Array.new(@V, 0)
      f = dfs(s, t, @inf)
      while f > 0
        flow += f
        f = dfs(s, t, @inf)
      end
    end
  end
end

__END__
v, e = gets.split.map(&:to_i)
g = Dinic.new(v)

e.times do |i|
  s, t, w = gets.split.map(&:to_i)
  g.add_edge(s, t, w)
end

puts g.max_flow(0, v-1)
