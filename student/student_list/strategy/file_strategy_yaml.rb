require 'yaml'
require_relative '../strategy/file_strategy'

class FileStrategyYAML < FileStrategy
  def read(file_path)
    return [] unless File.exist?(file_path) # Проверка существования файла

    file_content = File.read(file_path)
    YAML.safe_load(file_content, permitted_classes: [Symbol, Date], symbolize_names: true) || []
  rescue => e
    puts "Ошибка при чтении файла YAML: #{e.message}"
    []
  end

  def save(file_path, data)
    raise "File path is nil" if file_path.nil? # Проверка на nil

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

    # Открытие файла для записи
    File.open(file_path, 'w') { |file| file.write(preprocessing_data.to_yaml) }
  end
end