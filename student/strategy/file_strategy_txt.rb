require_relative 'file_strategy'

class FileStrategyTXT < FileStrategy
  def load(file_path)
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    file_content.lines.map do |line|
      # Разбиваем строку на части по ';' и собираем в хэш
      student_data = line.strip.split(';').map do |part|
        # Разделяем каждый элемент на ключ и значение
        key_value = part.split(':').map(&:strip)
        # Преобразуем ключ в символ, если ключ и значение существуют
        key_value.length == 2 ? [key_value[0].downcase.to_sym, key_value[1]] : nil
      end.compact.to_h
      student_data[:birthday] = Date.strptime(student_data[:birthday], '%d-%m-%Y') if student_data[:birthday]
      student_data
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