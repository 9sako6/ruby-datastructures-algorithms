class UnionFindWeighted
  def initialize(n)
    @parent = (0...n).to_a # 親の番号
    @rank = Array.new(n, 0) # 木の深さ
    @diff_weight = Array.new(n, 0) # 親との重みの差
  end

  def root(x)
    return x if @parent[x] == x
    r = root(@parent[x])
    @diff_weight[x] += @diff_weight[@parent[x]]
    @parent[x] = r
    return r
  end

  def weight(x)
    root(x)
    return @diff_weight[x]
  end

  def same?(x, y)
    root(x) == root(y)
  end

  def diff(x, y)
    # x と y とが同じグループにいるとき、weight(y) - weight(x) を返す
    # 同じグループでないならnil
    return nil if !same?(x, y)
    return weight(y) - weight(x)
  end

  def merge(x, y, w)
    # weight(y) - weight(x) = wとなるように結合
    w += weight(x)
    w -= weight(y)
    x, y = root(x), root(y)
    return false if x == y
    if @rank[x] < @rank[y]
      x, y = y, x
      w = -w
    end
    @rank[x] += 1 if @rank[x] == @rank[y]
    @parent[y] = x
    @diff_weight[y] = w
    return true
  end
end