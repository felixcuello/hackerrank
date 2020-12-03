def prime?(n)
  return false if n == 1

  i = 2
  prime = true
  while i*i <= n
    prime = false if n%i == 0
    i += 1
  end

  prime
end
