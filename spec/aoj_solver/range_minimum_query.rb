require "./lib/range_minimum_query"

n, q = gets.split.map(&:to_i)
rmq = RMQ.new(n)
ans = []
q.times do
  com, x, y = gets.split.map(&:to_i)
  if com == 0
    rmq.update(x, y)
  else
    ans << rmq.query(x, y + 1)
  end
end
puts ans