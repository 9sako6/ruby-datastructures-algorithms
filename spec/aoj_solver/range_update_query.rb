require "./lib/range_update_query.rb"

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