require "./lib/union_find_weighted"

n, q = gets.split.map(&:to_i)
uf = UnionFindWeighted.new(n)
ans = []
q.times do
  query = gets.split.map(&:to_i)
  if query[0] == 1
    x, y = query[1..-1]
    ans << (uf.diff(x, y) || "?")
  else
    x, y, z = query[1..-1]
    uf.merge(x, y, z)
  end
end

puts ans
