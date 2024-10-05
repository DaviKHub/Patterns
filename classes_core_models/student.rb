class Student
  attr_reader :id, :surname, :name, :patronymic, :phone, :telegram, :mail, :git #автоматическое создание только геттеров
  def initialize(params={})
    self.id=params[:id] if params[:id]
    self.surname=params[:surname] if params[:surname]
    self.name=params[:name] if params[:name]
    self.patronymic=params[:patronymic] if params[:patronymic]
    set_contacts(params) if params.key?(:phone) || params.key?(:telegram) || params.key?(:mail) || params.key?(:git)
  end
  def set_contacts(params={})
    self.phone = params[:phone] if params[:phone]
    self.telegram = params[:telegram] if params[:telegram]
    self.mail = params[:mail] if params[:mail]
    self.git = params[:git] if params[:git]
  end
  def id=(id)
    Student.valid_id?(id)? @id = id : puts("ID is invalid")
  end
  def surname=(surname)
    Student.valid_surname?(surname)? @surname = surname : puts("Surname is invalid")
  end
  def name=(name)
    Student.valid_name?(name)? @name = name : puts("Name is invalid")
  end
  def patronymic=(patronymic)
    Student.valid_patronymic?(patronymic)? @patronymic = patronymic : puts("Patronymic is invalid")
  end
  private def phone=(phone)
    Student.valid_phone?(phone)? @phone = phone : puts("Phone number is invalid")
  end
  private def telegram=(telegram)
    Student.valid_telegram?(telegram)? @telegram = telegram : puts("Telegram is invalid")
  end
  private def mail=(mail)
    Student.valid_mail?(mail)? @mail = mail : puts("Mail is invalid")
  end
  private def git=(git)
    Student.valid_git?(git)? @git = git : puts("Git link is invalid")
  end

  def to_s
    str = []
    str.push ("ID: #{@id}") if id
    str.push("Фамилия: #{@surname}")
    str.push("Имя: #{@name}")
    str.push("Отчество: #{@patronymic}")
    str.push("Телефон: #{@phone}") if phone
    str.push("Телеграм: #{@telegram}" ) if telegram
    str.push("Почта: #{@mail}" )if mail
    str.push("GitHub: #{@git}") if git
    str.join("\n")
  end

  def self.valid_id?(id)
    id.match?(/\A\d{10}\z/)
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
    telegram.match?(/\A@[a-zA-Z0-9_]{5,}\z/)
  end
  def self.valid_mail?(mail)
    mail.match?(/\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[^@\s]+\z/)
  end
  def self.valid_git?(git)
    git.match?(/\Ahttps:\/\/github.com\/[a-zA-Z0-9_-]+\z/)
  end
  def self.any_contact_present?(phone, telegram, mail)
    (!phone.nil? && !phone.empty?) ||
      (!telegram.nil? && !telegram.empty?) ||
      (!mail.nil? && !mail.empty?)
  end
  def self.git_present?(git)
    !git.nil? && !git.empty?
  end
  def validate
    errors=[]
    errors.push("Git link is missing") if Student.git_present?(@git)==false
    errors.push("Any contact is missing") if Student.any_contact_present?(@phone, @telegram, @mail)==false
    return "Validating is successful" if errors.empty?
    return "Validating is failed: #{errors.join("\n")}"
  end
end