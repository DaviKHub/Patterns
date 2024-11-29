require_relative 'student'
require_relative 'binary_tree'
def read_from_txt(path)
  students = []
  File.readlines(path, encoding: 'UTF-8').each do |line|
    students.push(Student.parse_from_string(line))
  end
  return students
end

def write_to_txt(path, file_name, students)
  File.open("#{path}/#{file_name}.txt", "w") do |file|
    file.write(students.join("\n"))
  end
end

tree = BinaryTree.new
students = read_from_txt("/Users/david/Patterns/Patterns_proj/student/students.txt")
students.each do |student|
  tree.insert(student)
end
tree.each {|el| puts el.obj.id}

puts students.sort! {|a,b| a <=> b}