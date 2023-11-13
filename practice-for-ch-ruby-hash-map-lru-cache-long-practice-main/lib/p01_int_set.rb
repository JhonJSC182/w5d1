class MaxIntSet

attr_accessor :store

  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_accessor :store, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet

  attr_accessor :num_buckets, :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    if count >= num_buckets
      @store = Array.new(num_buckets * 2) { Array.new }
      @store[num % num_buckets] << num
      count += 1
    end
  end

  def remove(num)
  end

  def include?(num)
    
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end

set = MaxIntSet.new(50)
set.insert(1)