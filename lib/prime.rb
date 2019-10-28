def divisor(n)
  # 約数の列挙O(√n)
  res = []
  i = 1
  while i*i <= n
    if n % i == 0
      res << i
      res << n/i if i != n/i
    end
    i += 1
  end
  res
end

def factoring(n)
  # 素因数分解O(√n)
  res = Hash.new(0)
  i = 2
  while i*i <= n
    while n % i == 0
      res[i] += 1
      n /= i
    end
    i += 1
  end
  res[n] = 1 if n != 1
  res
end