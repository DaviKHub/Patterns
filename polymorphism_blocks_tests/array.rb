class ArrayMethods

  attr_accessor :array

  def initialize(array)
    @array = array.dup.freeze
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

  def max_by()
    return nil if @array.empty?
    max_element = @array.first
    max_value = yield(max_element)
    @array.each do |element|
      value = yield(element)
      if value > max_value
        max_value = value
        max_element = element
      end
    end
    max_element
  end

  def max()
    return nil if @array.empty?
    max_element = @array.first
    @array.each do |element|
      max_element = element if yield(element, max_element) > 0
    end
    max_element
  end

  def reject
    array = []
    self.array.each do |element|
      array.push(element) unless yield(element)
    end
    array
  end

  def sort_by
    return [] if @array.empty?
    sorted_array = []
    @array.each do |element|
      index = 0
      while index < sorted_array.size && yield(sorted_array[index]) <= yield(element)
        index += 1
      end
      sorted_array.insert(index, element)
    end
    sorted_array
  end

  def to_a
    @array
  end
end
