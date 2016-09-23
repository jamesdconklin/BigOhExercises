require_relative 'datastructures'

def naive_mwr(arr, w)
  max_window_range = -1
  (0..(arr.length - w)).each do |start|
    window = arr[start,w]
    window_range = window.max - window.min
    max_window_range = window_range if max_window_range < window_range
  end

  max_window_range
end

def mwr(arr, w)
  idx = 0
  window = MinMaxStackQueue.new
  w.times do
    window.enqueue(arr[idx])
    idx += 1
  end
  max_range = window.max - window.min
  (idx...arr.count).each do |idy|
    window.dequeue
    window.enqueue(arr[idy])
    max_range = [window.max-window.min, max_range].max
  end
  max_range
end
