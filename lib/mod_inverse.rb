# source: https://qiita.com/drken/items/3b4fdf0a78e7a138cd9a#3-5-%E6%8B%A1%E5%BC%B5-euclid-%E3%81%AE%E4%BA%92%E9%99%A4%E6%B3%95%E3%81%AB%E3%82%88%E3%82%8B%E9%80%86%E5%85%83%E8%A8%88%E7%AE%97
def movinv(a, mod)
  b, u, v = mod, 1, 0
  while b > 0
    t = a / b
    a -= t * b
    a, b = b, a
    u -= t * v
    u, v = v, u
  end
  u %= mod
  u += mod if u < 0
  return u
end
__END__
# 1~12のmod 13での逆元を求める
(1..12).each do |i|
  puts "inv: #{movinv(i, 13)}"
end