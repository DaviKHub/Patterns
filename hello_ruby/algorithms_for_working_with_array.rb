def find_min_element(array)
  min = array[0]
  for i in 1..array.length-1
    if array[i] < min
      min = array[i]
    end
  end
  return min
end

def find_max_element(array)
  max=array[0]
  for i in 1..array.length-1
    if array[i] > max
      max = array[i]
    end
  end
  return max
end

def first_plus(array)
  first_element=0
  for i in 0..array.length-1
    if array[i]>0
      first_element = i
      break
    end
  end
  return first_element+1
end


print "Полученный массив: "
array = [-1, 5, 141, -914, 351, 1, 0, -9]
print(array, " \n")
print "Минимальный элемент: #{find_min_element(array)}\n"
print "Максимальный элемент: #{find_max_element(array)}\n"
print"Номер первого положительного элемента: #{first_plus(array)}\n"