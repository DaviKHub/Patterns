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
