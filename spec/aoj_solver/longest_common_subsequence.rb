require "./lib/longest_common_subsequence.rb"

n = gets.to_i
ans = []
n.times do
  x = gets.chomp
  y = gets.chomp
  ans << longest_common_subsequence(x, y)
end
puts ans