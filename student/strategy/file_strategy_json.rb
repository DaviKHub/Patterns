require 'json'
require_relative 'file_strategy'

class FileStrategyJSON < FileStrategy
  def load(file_path)
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    JSON.parse(file_content, symbolize_names: true)
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
    File.open(@path, 'w') { |file| file.write(JSON.pretty_generate(preprocessing_data)) }
  end
end