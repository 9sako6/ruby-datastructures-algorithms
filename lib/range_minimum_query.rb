class RMQ
  def initialize(n, inf = (1 << 30) - 1 + (1 << 30))
    @n = n, @l = 1, @inf = inf
    while @l < n
      @l <<= 1
    end
    @data = Array.new(@l * 2, @inf)
  end

  def update(i, x)
    i += @l
    @data[i] = x
    i >>= 1
    while i > 0
      @data[i] = min(@data[i * 2], @data[i * 2 + 1])
      i >>= 1
    end
    true
  end

  # minimum of [l, r)
  def query(l, r)
    _query(l, r, 1, 0, @l)
  end

  def [](k)
    @data[@l + k]
  end

  private

  def _query(l, r, k, sl, sr)
    return @inf if sr <= l || r <= sl
    return @data[k] if l <= sl && sr <= r
    dl = _query(l, r, k * 2, sl, (sl + sr) / 2)
    dr = _query(l, r, k * 2 + 1, (sl + sr) / 2, sr)
    min(dl, dr)
  end

  def min(a, b)
    return (a > b ? b : a)
  end
end
