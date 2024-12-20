require_relative 'student_list'

class StudentListTxt < StudentList
  def load_from
    if File.exist?(@path)
      File.readlines(@path, encoding: 'UTF-8').each do |line|
        @students_list.push(Student.parse_from_string(line))
      end
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
    File.open("#{@path}.txt", "w") do |file|
      file.write(preprocessing_data.join("\n"))
    end
  end
end