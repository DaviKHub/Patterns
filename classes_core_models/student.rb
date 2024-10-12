class Person
  attr_accessor :name, :surname, :patronymic
  attr_reader :phone, :telegram, :mail

  def initialize(params = {})
    self.name = params[:name] if params[:name]
    self.surname = params[:surname] if params[:surname]
    self.patronymic = params[:patronymic] if params[:patronymic]
    set_contact(params)
  end

  def set_contact(params = {})
    self.phone = params[:phone] if params[:phone]
    self.telegram = params[:telegram] if params[:telegram]
    self.mail = params[:mail] if params[:mail]
  end

  def surname=(surname)
    self.class.valid_surname?(surname) ? @surname = surname : raise(ArgumentError)
  end

  def name=(name)
    self.class.valid_name?(name) ? @name = name : raise(ArgumentError)
  end

  def patronymic=(patronymic)
    self.class.valid_patronymic?(patronymic) ? @patronymic = patronymic : raise(ArgumentError)
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

  def self.valid_surname?(surname)
    surname.match?(/\A[A-ZА-Я][a-zа-яё\-']{1,}\z/)
  end

  def self.valid_name?(name)
    name.match?(/\A[A-ZА-Я][a-zа-яё\-']{1,}\z/)
  end

  def self.valid_patronymic?(patronymic)
    patronymic.match?(/\A[A-ZА-Я][a-zа-яё\-']{1,}\z/)
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

  def self.parse_from_string(string)
    data = {}
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key
      when "Фамилия"
        data[:surname] = value
      when "Имя"
        data[:name] = value
      when "Отчество"
        data[:patronymic] = value
      when "Телефон"
        data[:phone] = value
      when "Почта"
        data[:mail] = value
      when "Телеграм"
        data[:telegram] = value
      end
    end
    data
  end
end

class Student < Person
  attr_reader :id, :git

  def initialize(params = {})
    super(surname: params[:surname],
          name: params[:name],
          patronymic: params[:patronymic],
          phone: params[:phone],
          telegram: params[:telegram],
          mail: params[:mail]
    )
    self.id = params[:id] if params[:id]
    self.git = params[:git] if params[:git]
  end

  def id=(id)
    self.class.valid_id?(id) ? @id = id : raise(ArgumentError)
  end

  def git=(git)
    self.class.valid_git?(git) ? @git = git : raise(ArgumentError)
  end

  def self.valid_id?(id)
    # changed to instance method
    id.to_s.match?(/\A[0-9]{10}+\z/)
  end

  def self.valid_git?(git)
    # changed to instance method
    git.match?(/\Ahttps:\/\/github.com\/[a-zA-Z0-9_-]+\z/)
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
      case key
      when "ID"
        data[:id] = value
      when "GitHub"
        data[:git] = value
      end
    end
    Student.new(**data)
  end


end

class Student_short < Student
  attr_reader :initials

  def initialize(params = {})
    super(params)
    @initials = "#{params[:surname]} #{params[:name][0]}.#{params[:patronymic][0]}."
  end

  def to_s
    info = []
    info.push("ID: #{@id}") if id
    info.push("Инициалы: #{@initials}")
    info.push("GitHub: #{@git}") if git
    info.compact.join("; ")
  end

  def self.parse_from_string(string)
    data = Student.parse_from_string(string)
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key
      when "Инициалы"
        data[:initials] = value
      when "GitHub"
        data[:git] = value
      end
    end
    Student_short.new(**data)
  end

end