class ArrayMethods
  attr_reader :array

  def initialize(array)
    self.array = array
  end

  private def array=(array)
    @array = array
  end

  def cycle(number)
    number.times do
      for element in array
        yield (element) if block_given?
      end
    end
    nil
  end

  def each_slice(slice_size)
    for i in (0...array.size).step(slice_size)
      slice = array[i, slice_size]
      yield(slice) if block_given?
    end
    nil
  end

  def inject(start_value = nil)
    accumulator = start_value.nil? ? array[0] : start_value
    start = start_value.nil? ? 1 : 0
    array[start..-1].each do |i|
      accumulator = yield(accumulator, i) if block_given?
    end
    accumulator
  end

  def max_by(n = 1)
    return nil if array.empty?
    array.map { |element| [yield(element), element] }
         .sort { |a, b| b[0] <=> a[0] }
         .first(n)
         .map { |pair| pair[1] }
  end

