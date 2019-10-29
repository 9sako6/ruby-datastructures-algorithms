require "./lib/levenshtein_distance.rb"

a = gets.chomp
b = gets.chomp
p levenshtein_distance(a, b)
