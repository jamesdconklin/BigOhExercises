def my_min_quad(arr)
  arr.each do |candidate|
    return candidate if arr.all? { |comp| candidate <= comp }
  end
end

def my_min_linear(arr)
  current_min = nil

  arr.each do |candidate|
    current_min = candidate if current_min.nil? || current_min > candidate
  end

  current_min
end

def lcs_cubic(arr)
  subs = []
  (0...(arr.length - 1)).each do |idx|
    ((idx + 1)..arr.length).each do |idy|
      subs << arr[idx...idy]
    end
  end
  max_sum = nil
  subs.each do |sub|
    sum = sub.inject(:+)
    max_sum = sum if max_sum.nil? || max_sum < sum
  end
  max_sum
end

def lcs_linear(arr)
  current_max = 0
  global_max = nil
  arr.each do |val|
    current_max += val
    global_max = current_max if global_max.nil? || global_max  < current_max
    current_max = [current_max, 0].max
  end
  global_max
end

#
# def lcs_linear_with_sub(arr)
#   current_max = 0
#   global_max = nil
#   global_start = 0
#   global_end = 0
#   current_start = 0
#   arr.each_with_index do |val, idx|
#     current_max += val
#     if global_max.nil? || global_max  < current_max
#       global_max = current_max
#       global_start = current_start
#       global_end = idx
#     end
#     if current_max < 0
#       current_start = idx + 1
#       current_max = 0
#     end
#   end
#   [global_max, a ]
# end
