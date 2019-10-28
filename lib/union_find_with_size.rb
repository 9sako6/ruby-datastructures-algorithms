class UnionFindWithSize
  def initialize(n)
    # 親の番号を格納
    # ただし、rootの位置には、-(その集合のサイズ)を格納
    @parent = Array.new(n, -1)
    @size = n
  end

  def root(x) # xのrootの番号を返す
    raise "UnionFindWithSize::IndexError" if x < 0 || @size <= x
    return x if @parent[x] < 0
    @parent[x] = root(@parent[x])
    return @parent[x]
  end

  def size(x) # xの属するグループのサイズを返す
    return -@parent[root(x)]
  end

  def merge(x, y)
    x, y = root(x), root(y)
    return false if x == y
    # 大きい方(x)に小さい方(y)をくっつけたい
    x, y = y, x if size(x) < size(y)
    @parent[x] += @parent[y]
    @parent[y] = x
    return true
  end

  def same?(x, y)
    root(x) == root(y)
  end
end
