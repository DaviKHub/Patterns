def is_min?(array, index)
  raise ArgumentError if index >= array.size || index < 0
  yield(array[index] == array.min) if block_given?
end

def swap!(array)
  min_index = array.index(array.min)
  max_index = array.index(array.max)
  array[min_index], array[max_index] = array[max_index], array[min_index]
  yield(array) if block_given?
end

def max_in_range?(array, a, b)
  yield(array[a..b].include?(array.max)) if block_given?
end

def new_array(array)
  avg = array.sum.to_f / array.size
  yield(array.select { |element| element > avg && element < array.max }) if block_given?
end
