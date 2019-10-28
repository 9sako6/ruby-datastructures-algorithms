def quick_sort_rec(arr)
  return arr if arr.size <= 1
  m = arr.shift
  less, more = arr.partition { |a| a < m } # たまの絶望O(N^2)
  return quick_sort_rec(less) + [m] + quick_sort_rec(more)
end

def quick_sort(arr)
  stack = []
  stack << [:less, arr]
  ret = []
  while !stack.empty?
    tag, s = stack.pop
    if s.size <= 1 || tag == :equal
      ret.concat(s)
    else
      m = s[0]
      less, other = s.partition { |e| e < m }
      equal, more = other.partition { |e| e == m }
      stack << [:more, more]
      stack << [:equal, equal]
      stack << [:less, less]
    end
  end
  ret
end
