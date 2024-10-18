require_relative 'person'

class Student < Person
  attr_reader :phone, :telegram, :mail

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, mail: nil, git: nil)
    super(
      surname: surname,
      name: name,
      patronymic: patronymic,
      id: id,
      git: git
    )
    set_contact(phone: phone, telegram: telegram, mail: mail)
  end

  def set_contact(phone: nil, telegram: nil, mail: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.mail = mail if mail
  end

  private def phone=(phone)
    self.class.valid_phone?(phone) ? @phone = phone : raise(ArgumentError)
  end

  private def telegram=(telegram)
    self.class.valid_telegram?(telegram) ? @telegram = telegram : raise(ArgumentError)
  end

  private def mail=(mail)
    self.class.valid_mail?(mail) ? @mail = mail : raise(ArgumentError)
  end

  def self.valid_phone?(phone)
    phone.match?(/\A\+?\d{10,11}\z/)
  end

  def self.valid_telegram?(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]{4,}\z/)
  end

  def self.valid_mail?(mail)
    mail.match?(/\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[^@\s]+\z/)
  end

  private def any_contact_present?(phone, telegram, mail)
    (!phone.nil? && !phone.empty?) ||
      (!telegram.nil? && !telegram.empty?) ||
      (!mail.nil? && !mail.empty?)
  end

  private def git_present?(git)
    !git.nil? && !git.empty?
  end

  def validate
    git_present?(@git) || any_contact_present?(@phone, @telegram, @mail)
  end
  def to_s
    str = []
    str.push ("ID: #{@id}") if id
    str.push("Фамилия: #{@surname}")
    str.push("Имя: #{@name}")
    str.push("Отчество: #{@patronymic}")
    str.push("Телефон: #{@phone}") if phone
    str.push("Телеграм: #{@telegram}") if telegram
    str.push("Почта: #{@mail}") if mail
    str.push("GitHub: #{@git}") if git
    str.compact.join("; ")
  end

  def get_info
    info = []
    info.push("Инициалы: #{surname}.#{name[0]}.#{patronymic[0]}.")
    info.push("GitHub: #{@git}") if git
    info.push("Телефон: #{@phone}") if phone
    info.push("Телеграм: #{@telegram}") if telegram
    info.push("Почта: #{@mail}") if mail
    info.join(";")
  end

  def self.parse_from_string(string)
    data = Person.parse_from_string(string)

    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "github"
        data[:git] = value
      when "телефон"
        data[:phone] = value
      when "почта"
        data[:mail] = value
      when "телеграм"
        data[:telegram] = value
      end
    end
    Student.new(**data)
  end
end