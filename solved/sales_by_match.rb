# Complete the sockMerchant function below.
def sockMerchant(n, ar)
    c = Hash.new(0)
    for i in (0..n-1)
        c[ar[i]] += 1
    end
    
    result = 0
    c.keys.each do |k|
        result += c[k] / 2
    end
    
    result
end
