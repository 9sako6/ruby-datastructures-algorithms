require "./lib/priority_queue"

q = PriorityQueue.new{|x, y| x > y}
ans = []
while true
  input = gets.chomp
  if input == "end"
    break
  elsif input == "extract"
    ans << q.pop
  else
    x = input.split[1].to_i
    q << x
  end
end
puts ans