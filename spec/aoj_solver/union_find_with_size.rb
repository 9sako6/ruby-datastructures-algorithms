# https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/1/DSL_1_A

require "./lib/union_find_with_size"
n, q = gets.split.map(&:to_i)
uf = UnionFindWithSize.new(n)
ans = []
q.times do |i|
  com, x, y = gets.split.map(&:to_i)
  if com == 0
    uf.merge(x, y)
  else
    ans << (uf.same?(x, y) ? 1 : 0)
  end
end
puts ans
