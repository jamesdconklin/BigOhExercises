require 'set'
# O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.count-1).each do |idx|
    ((idx+1)...arr.count).each do |idy|
      return true if arr[idx]+arr[idy] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  sorted_arr = arr.sort
  idx = 0
  idy = sorted_arr.count-1
  until idy <= idx
    new_sum = sorted_arr[idx] + sorted_arr[idy]
    return true if new_sum == target_sum
    if new_sum > target_sum
      idy -= 1
    else
      idx += 1
    end
  end
  false
end

def pair_sum?(arr,target_sum)
  hash = Hash.new

  arr.each do |val|
    return true if hash[target_sum - key]
    hash[val] = true
  end

  false
end

# TODO THIS SHIT IS ALMOST NP
def n_sum?(arr, n, target_sum)

  level_sums = Array.new(n) {Set.new}

  arr.each do |el|
      (n-2).downto(0) do |idx|
        level_sums[idx+1] += Set.new(level_sums[idx].map{|member| member+el})
    end
    level_sums[0] += Set.new([el])
  end
  return level_sums.last.include?(target_sum)

end
