class RangeUpdateQuery
  def initialize(n, inf = Float::INFINITY)
    @n = n
    @l = 1
    while @l < n
      @l *= 2
    end
    @data = Array.new(2 * @l - 1) { inf }
  end

  def _update(s, t, x, l, r, k)
    if s == l && t == r
      @data[k] = x
    else
      if @data[k] > -1
        @data[2 * k + 1] = @data[2 * k + 2] = @data[k]
        @data[k] = -1
      end
      m = (l + r) / 2
      if t <= m
        _update(s, t, x, l, m, 2 * k + 1)
      elsif m <= s
        _update(s, t, x, m, r, 2 * k + 2)
      else
        _update(s, m, x, l, m, 2 * k + 1)
        _update(m, t, x, m, r, 2 * k + 2)
      end
    end
  end

  def update(s, t, x)
    # add [s, t+1]
    _update(s, t + 1, x, 0, @l, 0)
  end

  def _find(i, l, r, k)
    return @data[k] if @data[k] > -1
    m = (l + r) / 2
    if i < m
      return _find(i, l, m, 2 * k + 1)
    else
      return _find(i, m, r, 2 * k + 2)
    end
  end

  def find(s, t)
    _find(s, t, @l, 0)
  end
end

__END__
n, q = gets.split.map(&:to_i)
ruq = RangeUpdateQuery.new(n)
ans = []
q.times do
  com, s, t, x = gets.split.map(&:to_i)
  case com
  when 0
    ruq.update(s, t, x)
  when 1
    ans << ruq.find(s, 0)
  end
end
puts ans.map { |x| x == Float::INFINITY ? 2147483647 : x }
