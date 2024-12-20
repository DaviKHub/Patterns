require 'json'
require_relative 'student_list'

class StudentListJson < StudentList
  def load_from
    if File.exist?(@path)
      file_content = File.read(@path)
      student_data = JSON.parse(file_content, symbolize_names: true)
      @students_list = student_data.map { |data| Student.new(**data) }
    else
      @students_list = []
    end
  end

  def save
    preprocessing_data = @students_list.map do |student|
      {
        id: student.id,
        name: student.name,
        surname: student.surname,
        patronymic: student.patronymic,
        git: student.git,
        mail: student.mail,
        phone: student.phone,
        telegram: student.telegram,
        birthdate: student.birthdate,
      }
    end
    File.open(@path, 'w') { |file| file.write(JSON.pretty_generate(preprocessing_data)) }
  end
end