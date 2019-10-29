def levenshtein_distance(str1, str2)
  #
  # O(str1.size * str2.size)
  #
  # references:
  #   - https://www.youtube.com/watch?v=MiqoA-yF-0M
  #
  n = str1.size
  m = str2.size
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  (n + 1).times { |i| dp[i][0] = i }
  (m + 1).times { |j| dp[0][j] = j }
  str1 = str1.split("")
  str2 = str2.split("")
  str1.each_with_index do |c1, i|
    str2.each_with_index do |c2, j|
      min = [dp[i][j], dp[i + 1][j], dp[i][j + 1]].min
      dp[i + 1][j + 1] = (c1 == c2 ? dp[i][j] : min + 1)
    end
  end
  dp[n][m]
end
