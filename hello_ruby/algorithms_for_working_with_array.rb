def find_min_element(array)
  min = array[0]
  for i in 1..array.length-1
    if array[i] < min
      min = array[i]
    end
  end
  return min
end


print "Полученный массив: "
array = [-1, 5, 141, -914, 351, 1, 0, -9]
print(array, " \n")
print "Минимальный элемент: #{find_min_element(array)}\n"