require '../student'
require '../student_short'
class StudentListTxt
  attr_accessor :studentlist
  attr_reader :path

  def initialize(path, studentlist)
    @path = path
    @studentlist = studentlist
  end

  def read(path)
    @studentlist = []
    File.readlines(path, encoding: 'UTF-8').each do |line|
      @studentlist.push(Student.parse_from_string(line))
    end
    return @studentlist
  end

  def write(path, file_name, studentlist)
    File.open("#{path}/#{file_name}.txt", "w") do |file|
      file.write(@studentlist.join("\n"))
    end
  end

  def get_from_id(id)
    @studentlist.find_all { |student| student.id == id }
  end

end