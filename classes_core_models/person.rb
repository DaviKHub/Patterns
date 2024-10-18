class Person
  attr_reader :id, :name, :surname, :patronymic, :git

  def initialize(id:, surname:, name:, patronymic:, git: nil)
    self.id = id
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
    self.git = git
  end

  def id=(id)
    self.class.valid_id?(id) ? @id = id : raise(ArgumentError)
  end

  def surname=(surname)
    self.class.valid_name_parts?(surname) ? @surname = surname : raise(surname)
  end

  def name=(name)
    self.class.valid_name_parts?(name) ? @name = name : raise(name)
  end

  def patronymic=(patronymic)
    self.class.valid_name_parts?(patronymic) ? @patronymic = patronymic : raise(patronymic)
  end

  def git=(git)
    self.class.valid_git?(git) ? @git = git : raise(ArgumentError)
  end

  def self.valid_id?(id)
    id.match?(/\A\d{10}\z/)
  end

  def self.valid_name_parts?(string)
    string.match?(/\A[A-ZА-Я][a-zа-яё\-']{0,}\z/)
  end

  def self.valid_git?(git)
    git.match?(/\Ahttps:\/\/github.com\/[a-zA-Z0-9_-]+\z/)
  end

  def self.parse_from_string(string)
    data = {}
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "id"
        data[:id] = value
      when "фамилия"
        data[:surname] = value
      when "имя"
        data[:name] = value
      when "отчество"
        data[:patronymic] = value
      when "github"
        data[:git] = value
      end
    end
    data
  end
end