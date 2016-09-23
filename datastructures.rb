# class MyQueue
#
#   def initialize
#     @store = []
#   end
#
#   def enqueue(el)
#     @store << el
#   end
#
#   def dequeue
#     @store.shift
#   end
#
#   def peek
#     @store.first
#   end
#
#   def size
#     @store.count
#   end
#
#   def empty?
#     @store.empty?
#   end
#   private
#   attr_reader :store
#
# end

class MinMaxStack
  attr_accessor :min, :max

  def initialize
    @store = []
    @min = nil
    @max = nil
  end

  def pop
    return nil if empty?
    value, min_max = @store.pop
    @min,@max = min_max
    value
  end

  def peek
    @store.last.first
  end

  def push(el)
    vector = [el, [@min,@max]]
    @min = el if @min.nil? || el < @min
    @max = el if @max.nil? || el > @max
    @store << vector
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  private
  attr_reader :store
end

class MinMaxStackQueue
  def initialize
    @nq_stack = MinMaxStack.new
    @dq_stack = MinMaxStack.new
  end

  def flip
    until nq_stack.empty?
      dq_stack.push(nq_stack.pop)
    end
  end

  def dequeue
    return nil if empty?
    flip if dq_stack.empty?
    dq_stack.pop
  end

  def enqueue(el)
    nq_stack.push(el)
  end

  def min
    return dq_stack.min if nq_stack.min.nil?
    return nq_stack.min if dq_stack.min.nil?
    [nq_stack.min,dq_stack.min].min
  end


    def max
      return dq_stack.max if nq_stack.max.nil?
      return nq_stack.max if dq_stack.max.nil?
      [nq_stack.max,dq_stack.max].max
    end

  def peek
    return nil if empty?
    flip if dq_stack.empty?
    dq_stack.peek
  end

  def empty?
    size == 0
  end

  def size
    @nq_stack.size + @dq_stack.size
  end

  private
  attr_reader :nq_stack, :dq_stack
end
