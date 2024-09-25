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

selected_method=ARGV[0].to_i
selected_array=ARGV[1]
array = File.new(selected_array, "r:UTF-8").readlines.map(&:to_i)
case selected_method
when 1 then print "Минимальный элемент: #{find_min_element(array)}\n"
when 2 then print "Максимальный элемент: #{find_max_element(array)}\n"
when 3 then print"Номер первого положительного элемента: #{first_plus(array)}\n"
else puts "Такой команды не существует"
end