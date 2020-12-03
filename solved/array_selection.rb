def select_arr(arr)
  # select and return all odd numbers from the Array variable `arr`
  arr.select { |e| e%2 == 1 }
end

def reject_arr(arr)
  # reject all elements which are divisible by 3
  arr.reject { |e| e%3 == 0 }
end

def delete_arr(arr)
  # delete all negative elements
  arr.delete_if { |e| e < 0 }
end

def keep_arr(arr)
  # keep all non negative elements ( >= 0)
  arr.keep_if { |e| e >= 0 }
end
