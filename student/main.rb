require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'data/data_list_student_short'
# require_relative 'binary_tree'
require_relative 'strategy/file_strategy_yaml'
require_relative 'strategy/file_strategy_txt'
require_relative 'student_list'
# tree = BinaryTree.new
# students = read_from_txt("/Users/david/Patterns/Patterns_proj/student/students.txt")
# students.each do |student|
#   tree.insert(student)
# end
# tree.each {|el| puts el.obj}

students=StudentList.new("student/students.txt", FileStrategyTXT.new)
puts students.count