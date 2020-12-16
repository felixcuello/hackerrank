#!/bin/ruby

all = []

def pos(matrix, row, col)
  matrix[row*3 + col];
end

def find_square(all, numbers, result = [])
  if numbers.count == 0
    return false if(pos(result,0,0) + pos(result,1,1) + pos(result,2,2) != 15) # Diagonal 1
    return false if(pos(result,2,0) + pos(result,1,1) + pos(result,0,2) != 15) # Diagonal 2
    return false if(pos(result,0,0) + pos(result,0,1) + pos(result,0,2) != 15) # row 1
    return false if(pos(result,1,0) + pos(result,1,1) + pos(result,1,2) != 15) # row 2
    return false if(pos(result,2,0) + pos(result,2,1) + pos(result,2,2) != 15) # row 3
    return false if(pos(result,0,0) + pos(result,1,0) + pos(result,2,0) != 15) # col 1
    return false if(pos(result,0,1) + pos(result,1,1) + pos(result,2,1) != 15) # col 2
    return false if(pos(result,0,2) + pos(result,1,2) + pos(result,2,2) != 15) # col 3

    all << result
  else
    for n in numbers
      find_square(all, numbers - [n], result.dup << n)
    end
  end
end

def difference(a, b)
  ans = 0
  for i in (0..8)
    ans += (a[i] - b[i]).abs
  end
  ans
end

find_square(all, [1,2,3,4,5,6,7,8,9])

x = []
3.times do |i|
  x += gets.rstrip.split(' ').map(&:to_i)
end

min_diff = 1000000
for a in all
  current_diff = difference(a,x)
  min_diff = current_diff if current_diff < min_diff
end

puts min_diff
