require_relative 'person'
require 'date'

class Student < Person

  include Comparable
  attr_reader :surname, :name, :patronymic, :phone, :telegram, :mail, :birthdate

  def initialize(surname:, name:, patronymic:, id: nil, phone: nil, telegram: nil, mail: nil, git: nil, birthdate: nil)
    super(
      id: id,
      git: git
    )
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.birthdate = birthdate
    set_contact(phone: phone, telegram: telegram, mail: mail)
  end

  def set_contact(phone: nil, telegram: nil, mail: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.mail = mail if mail
  end

  def surname=(surname)
    self.class.valid_name_parts?(surname) ? @surname = surname : raise(ArgumentError, surname)
  end

  def name=(name)
    self.class.valid_name_parts?(name) ? @name = name : raise(ArgumentError, name)
  end

  def patronymic=(patronymic)
    self.class.valid_name_parts?(patronymic) ? @patronymic = patronymic : raise(ArgumentError, patronymic)
  end

  private def phone=(phone)
    self.class.valid_phone?(phone) ? @phone = phone : raise(ArgumentError, phone)
  end

  private def telegram=(telegram)
    self.class.valid_telegram?(telegram) ? @telegram = telegram : raise(ArgumentError, telegram)
  end

  private def mail=(mail)
    self.class.valid_mail?(mail) ? @mail = mail : raise(ArgumentError, mail)
  end

  def birthdate=(birthdate)
    Student.valid_date?(birthdate) ? @birthdate = Date.strptime(birthdate, '%Y-%m-%d') : raise(ArgumentError, birthdate)
  end

  def self.valid_name_parts?(string)
    string.match?(/\A[A-ZА-Я][a-zа-яё\-']{0,}\z/)
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

  def self.valid_date?(date)
    begin
      Date.strptime(date, '%Y-%m-%d')
      true
    rescue ArgumentError
      false
    end
  end

  private def contact_present?(contact)
    !contact.nil? && !contact.empty?
  end

  def validate?
    git_present?(@git) || contact_present?(contact)
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
    str.push("ДатаРождения: #{@birthdate}")
    str.compact.join("; ")
  end

  def get_info
    info = []
    info.push("Инициалы: #{initials}")
    info.push("GitHub: #{@git}") if git
    info.push("Телефон: #{@phone}") if phone
    info.push("Телеграм: #{@telegram}") if telegram
    info.push("Почта: #{@mail}") if mail
    info.join(";")
  end

  def contact
    return @phone if phone
    return @mail if mail
    return @telegram if telegram
    return nil
  end

  def initials
    "#{surname}#{name[0]}.#{patronymic[0]}."
  end

  def self.from_string(string)
    data = Person.from_string(string)
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "фамилия"
        data[:surname] = value
      when "имя"
        data[:name] = value
      when "отчество"
        data[:patronymic] = value
      when "github"
        data[:git] = value
      when "телефон"
        data[:phone] = value
      when "почта"
        data[:mail] = value
      when "телеграм"
        data[:telegram] = value
      when "датарождения"
        data[:birthdate] = value
      end
    end
    Student.new(**data)
  end

  def self.from_hash(hash)
    new(id: hash[:id].to_i,
        surname: hash[:surname],
        name: hash[:name],
        patronymic: hash[:patronymic],
        phone: hash[:phone],
        telegram: hash[:telegram],
        mail: hash[:mail],
        birthdate: hash[:birthdate],
        git: hash[:git])
  end

  def <=>(other)
    return nil unless other.is_a?(Student)
    birthdate <=> other.birthdate
  end
end