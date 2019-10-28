class UnionFindWithRank
  def initialize(n)
    @parent = Array.new(n, -1)
    @rank = Array.new(n, 0)
    @size = n
  end

  def root(x)
    raise "UnionFindWithRank::IndexError" if x < 0 || @size <= x
    return x if @parent[x] == -1
    @parent[x] = root(@parent[x])
    return @parent[x]
  end

  def same?(x, y)
    return root(x) == root(y)
  end

  def merge(x, y)
    x, y = root(x), root(y)
    return false if x == y
    x, y = y, x if @rank[x] < @rank[y]
    @rank[x] += 1 if @rank[x] == @rank[y]
    @parent[y] = x
    return true
  end
end
