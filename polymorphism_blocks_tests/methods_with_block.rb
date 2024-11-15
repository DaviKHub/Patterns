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

array = []
loop do
  system("cls") || system("clear")
  print "0 - Выход\n1 - Чтение массива с файла \n2 - Чтение массива с консоли \nВведите команду: "
  case gets.chomp
  when "1"
    system("cls") || system("clear")
    print("Введите путь к файлу с массивом: ")
    array = File.new(gets.chomp, "r:UTF-8").readlines.map(&:to_i)
    break
  when "2"
    system("cls") || system("clear")
    puts("Введите массив (через пробел, по завершении - Enter): ")
    array = gets.chomp.split.map { |i| i.to_i }
    break
  when "0"
    exit
  else
    puts "Такой команды не существует."
  end
  puts "Нажмите Enter для продолжения..."
  gets
end

loop do
  system("cls") || system("clear")
  puts "1 - Проверка на глобальный минимум"
  puts "2 - Обмен минимального и максимального"
  puts "3 - Проверка на максимальный в диапазоне"
  puts "4 - Новый массив"
  puts "0 - Выход"
  print "Введите номер метода: "
  select_method = gets.chomp

  case select_method
  when "1"
    print "Введите номер элемента для проверки: "
    index = gets.chomp.to_i
    is_min?(array, index - 1) { |result| puts "Результат: #{result}" }
  when "2"
    swap!(array) { |result| puts "Результат: #{result}" }
  when "3"
    print "Введите a и b (индексы массива через пробел): "
    (a, b) = gets.split.map { |char| char.to_i }
    max_in_range?(array, a, b) { |result| puts "Результат: #{result}" }
  when "4"
    new_array(array) { |result| puts "Результат: #{result}" }
  when "0"
    exit
  else
    puts "Такой команды не существует."
  end
  puts "Нажмите Enter для продолжения..."
  gets
end