class Student
  def initialize(id:nil, surname:, first_name:, second_name:,
                 phone:nil, telegram:nil, mail:nil, git:nil)
    @id=id if id!=nil
    @surname=surname
    @first_name=first_name
    @second_name=second_name
    @phone=phone if phone!=nil
    @telegram=telegram if telegram!=nil
    @mail=mail if mail!=nil
    @git=git if git!=nil
  end

#написание  геттеров
  def id
    @id
  end
  def surname
    @surname
  end
  def first_name
    @first_name
  end
  def second_name
    @second_name
  end
  def phone
    @phone
  end
  def telegram
    @telegram
  end
  def mail
    @mail
  end
  def git
    @git
  end

#написание  сеттеров
  def id=(value)
    @id = value
  end
  def surname=(value)
    @surname = value
  end
  def first_name=(value)
    @first_name = value
  end
  def second_name=(value)
    @second_name = value
  end
  def phone=(value)
    @phone = value
  end
  def telegram=(value)
    @telegram = value
  end
  def mail=(value)
    @mail = value
  end
  def git=(value)
    @git = value
  end

  def to_s
    str = []
    str.push ("ID: #{@id}" ) if id
    str.push("Фамилия: #{@surname}")
    str.push("Имя: #{@first_name}")
    str.push("Отчество: #{@second_name}")
    str.push("Телефон: #{@phone}") if phone
    str.push("Телеграм: #{@telegram}" ) if telegram
    str.push("Почта: #{@mail}" )if mail
    str.push("GitHub: #{@git}") if git
    return str.join("\n")
  end
end