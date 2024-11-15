def is_min?(array, index)
  raise ArgumentError if index >= array.size || index < 0
  yield(array[index] == array.min) if block_given?
end
