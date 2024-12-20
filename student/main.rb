require_relative 'student'
require_relative 'student_short'
require_relative 'data/data_list_student_short'
# require_relative 'binary_tree'
require_relative 'student_list/student_list_json'
require_relative 'student_list/student_list_txt'
require_relative 'student_list/student_list_yaml'
# tree = BinaryTree.new
# students = read_from_txt("/Users/david/Patterns/Patterns_proj/student/students.txt")
# students.each do |student|
#   tree.insert(student)
# end
# tree.each {|el| puts el.obj}



students = StudentListTxt.new("student/students.txt")

students_short = students.map { |element| StudentShort.initialize_from_student(element) }
data_list = DataList.new(students_short)
data_list.select(0)
puts "Выбранные: #{data_list.get_selected}"
data_list.select(2)
puts "Выбранные: #{data_list.get_selected}"
list_student_short = DataListStudentShort.new(students_short)
list_student_short.select(0)
puts "Выбранные: #{list_student_short.get_selected}"
list_student_short.select(1)
puts "Выбранные: #{list_student_short.get_selected}"
list_student_short.select(2)
puts "Выбранные: #{list_student_short.get_selected}"

puts "Таблица выбранных студентов:"
table = list_student_short.get_data
puts table
