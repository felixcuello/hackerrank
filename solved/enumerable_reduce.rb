def sum_terms(n)
  (1..n).inject(0) { |acc, e| acc += e**2+1 }
end
