def longest_common_subsequence(str1, str2)
  #
  # O(str1.size * str2.size)
  #
  # references:
  #   - https://www.youtube.com/watch?v=ASoaQq66foQ
  #   - https://qiita.com/_rdtr/items/c49aa20f8d48fbea8bd2
  #   - https://ikatakos.com/pot/programming_algorithm/dynamic_programming/longest_common_subsequence
  #
  n = str1.size
  m = str2.size
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  str1 = str1.split("")
  str2 = str2.split("")
  str1.each_with_index do |c1, i|
    str2.each_with_index do |c2, j|
      if c1 != c2
        dp[i + 1][j + 1] = [dp[i][j + 1], dp[i + 1][j]].max 
      else
        dp[i + 1][j + 1] = dp[i][j] + 1
      end
    end
  end
  dp[n][m]
end



