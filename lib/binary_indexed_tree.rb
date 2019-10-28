class BinaryIndexedTree
  def initialize(n, array = nil)
    @n = n
    @bit = Array.new(@n + 1, 0)
    if array.nil?
      @array = Array.new(@n, 0)
    else
      @array = array.dup
    end
    @n.times { |i| add(i, @array[i]) }
  end

  def sum(i)
    s = 0
    i += 1
    while i > 0
      s += @bit[i]
      i -= (i & -i)
    end
    s
  end

  # sum of [left, right]
  #   0-indexed
  def range(left, right)
    left > right ? 0 : (sum(right) - sum(left - 1))
  end

  # add x at bit[i] (i is 0-indexed)
  def add(i, x)
    i += 1
    while i <= @n
      @bit[i] += x
      i += (i & -i)
    end
  end
end

__END__
n, q = gets.split.map(&:to_i)
ans = []
bit = BinaryIndexedTree.new(n)
q.times do
  com, x, y = gets.split.map(&:to_i)
  x -= 1
  if com == 0
    bit.add(x, y)
  else
    y -= 1
    ans << bit.range(x, y)
  end
end

puts ans
