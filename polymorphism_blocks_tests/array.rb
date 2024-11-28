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

  def reject
    array = []
    self.array.each do |element|
      array.push(element) unless yield(element)
    end
    array
  end

  def sort_by
    return nil if array.empty?
    array.map { |element| [yield(element), element] }
         .sort { |a, b| a[0] <=> b[0] }
         .map { |pair| pair[1] }
  end
end

array1 = ArrayMethods.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
array2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print "#{array1.each_slice(4) { |a| puts "#{a.inspect}" }}\n"
print "#{array2.each_slice(4) { |a| puts "#{a.inspect}" }}\n"
puts
print "#{array1.cycle(3) { |a| print "#{a.inspect}" }}\n"
print "#{array2.cycle(3) { |a| print "#{a.inspect}" }}\n"
puts
print "#{array1.inject { |sum, element| sum + element }}\n"
print "#{array2.inject { |sum, element| sum + element }}\n"
puts
print "#{array1.max_by(5) { |a| a.even? ? a : -1 }}\n"
print "#{array2.max_by(5) { |a| a.even? ? a : -1 }}\n"
puts
print "#{array1.reject { |a| a.even? }}\n"
print "#{array2.reject { |a| a.even? }}\n"
puts
print "#{array1.sort_by { |a| -a }}\n"
print "#{array2.sort_by { |a| -a }}\n"