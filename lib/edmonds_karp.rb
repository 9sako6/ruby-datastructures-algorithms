class EdmondsKarp
  def initialize(n)
    @n = n
    @flow = Array.new(n) { Array.new(n, 0) }
    @cap = Array.new(n) { Array.new(n, 0) }
  end

  def add_edge(s, t, w)
    @cap[s][t] = w
  end

  def max_flow(start, goal)
    inf = 2 ** 30
    sum = 0
    while true
      que = [start]
      prev = Array.new(@n, -1)
      prev[start] = start
      while !que.empty? && prev[goal] == -1
        u = que.shift
        @n.times do |i|
          if prev[i] == -1 && @cap[u][i] - @flow[u][i] > 0
            prev[i] = u
            que.push(i)
          end
        end
      end
      return sum if (prev[goal] == -1)
      inc = inf
      c = goal
      while c != start
        inc = [inc, @cap[prev[c]][c] - @flow[prev[c]][c]].min
        c = prev[c]
      end
      c = goal
      while c != start
        @flow[prev[c]][c] += inc
        @flow[c][prev[c]] -= inc
        c = prev[c]
      end
      sum += inc
    end
  end
end

__END__
vn, en = gets.split.map(&:to_i)
g = EdmondsKarp.new(vn)

en.times do |i|
  s, t, w = gets.split.map(&:to_i)
  g.add_edge(s, t, w)
end

puts g.max_flow(0, vn - 1)
