require_relative 'person'

class StudentShort < Person
  attr_reader :initials, :contacts

  def initialize(data_or_id)
    @contacts = []
    if data_or_id.is_a?(Student)
      initialize_from_student(data_or_id)
    elsif data_or_id.is_a?(String)
      initialize_from_string(data_or_id)
    end
  end

  def to_s
    info = []
    info.push("ID: #{@id}") if id
    info.push("Initials: #{@initials}")
    info.push("GitHub: #{@git}") if git
    info.push("#{@contacts.join("; ")}") unless @contacts.empty?
    info.compact.join("; ")
  end

  private def initialize_from_student(student)
    @id = student.id
    @initials = "#{student.surname}#{student.name[0]}.#{student.patronymic[0]}."
    @git = student.git
    @contacts << "Phone: #{student.phone}" if student.phone
    @contacts << "Telegram: #{student.telegram}" if student.telegram
    @contacts << "Mail: #{student.mail}" if student.mail
  end

  private def initialize_from_string(string)
    data = Person.parse_from_string(string)
    @id = data[:id]
    @git = data[:git]
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "initials"
        @initials = value
      when "phone"
        @contacts << "Phone: #{value}"
      when "telegram"
        @contacts << "Telegram: #{value}"
      when "mail"
        @contacts << "Mail: #{value}"
      end
    end
  end
end