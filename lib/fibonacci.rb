require "matrix"

def fibonacci(n)
  (Matrix[[0, 1], [1, 1]] ** n)[0, 1]
end
