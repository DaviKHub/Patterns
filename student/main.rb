require_relative 'student'
require_relative 'binary_tree'

tree = BinaryTree.new
students = read_from_txt("/Users/david/Patterns/Patterns_proj/student/students.txt")
students.each do |student|
  tree.insert(student)
end
tree.each {|el| puts el.obj}


[1,2,3,4].max
puts students.sort! {|a,b| a <=> b}
print ["aa", "a", "aaa"].max_by(2){|a|a.length}
print ["aa", "a", "aaa"].max(2){|a, b|a.length<=>b.length}