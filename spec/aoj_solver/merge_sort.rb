require("./lib/merge_sort.rb")

n = gets.to_i
s = gets.split.map(&:to_i)

puts merge_sort(s) * " "
puts $comperation_count
