require "./lib/binary_indexed_tree.rb"

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