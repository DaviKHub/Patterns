require_relative 'file_strategy'

class FileStrategyTXT < FileStrategy
  def load(file_path)
    return [] unless File.exist?(file_path)
    data = File.read(file_path)
    data.map do |student_data|
      Student.new(id: student_data[:id],
                  surname: student_data[:surname],
                  name: student_data[:name],
                  patronymic: student_data[:patronymic],
                  phone: student_data[:phone],
                  telegram: student_data[:telegram],
                  mail: student_data[:mail],
                  git: student_data[:git],
                  birthdate: student_data[:birthdate],
      )
    end
  end

  def save(file_path, data)
    preprocessing_data = data.map do |student|
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
    File.open("#{file_path}", "w") do |file|
      file.write(preprocessing_data.join("\n"))
    end
  end
end