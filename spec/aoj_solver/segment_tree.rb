require "./lib/segment_tree"

n, q = gets.split.map(&:to_i)
rmq = SegmentTree.new(n, (1 << 31) - 1) { |x, y| x > y ? y : x }
ans = []
rmq.build()
q.times do
  com, x, y = gets.split.map(&:to_i)
  if com == 0
    rmq.update(x, y)
  else
    ans << rmq.get(x, y + 1)
  end
end
puts ans
