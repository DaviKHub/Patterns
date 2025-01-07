class StudentShort < Person
  attr_reader :initials, :contact

  def initialize(initials:, id: nil, contact: nil, git: nil)
    super(id: id,
          git: git
    )
    self.contact = contact
    self.initials = initials
  end

  def initials=(initials)
    @initials = initials
  end

  def contact=(contact)
    @contact = contact
  end

  def self.from_student(student)
    data = {}
    data[:id] = student.id if student.id
    data[:initials] = student.initials
    data[:git] = student.git
    data[:contact] = student.contact
    StudentShort.send(:new, **data)
  end

  def self.from_string(string)
    data = Person.from_string(string)
    string.split('; ').each do |pair|
      key, value = pair.split(': ').map(&:strip)
      case key.downcase
      when "инициалы"
        data[:initials] = value
      when "контакт"
        data[:contact] = value
      end
    end
    StudentShort.send(:new, **data)
  end

  def to_s
    info = []
    info.push("ID: #{@id}") if id
    info.push("Инициалы: #{@initials}")
    info.push("GitHub: #{@git}") if git
    info.push("Контакт: #{@contact}")
    info.compact.join("; ")
  end

  def validate?
    git_present?(@git) || !@contact.nil? && !@contact.empty?
  end

  private_class_method :new
end