class Student
  attr_accessor :id, :surname, :first_name, :second_name, :phone, :telegram, :mail, :git
  def initialize(id:nil, surname:, first_name:, second_name:,
                 phone:nil, telegram:nil, mail:nil, git:nil)
    @id=id
    @surname=surname
    @first_name=first_name
    @second_name=second_name
    @phone=phone
    @telegram=telegram
    @mail=mail
    @git=git
  end

  def to_s
    str = []
    str.push ("ID: #{@id}") if id
    str.push("Фамилия: #{@surname}")
    str.push("Имя: #{@first_name}")
    str.push("Отчество: #{@second_name}")
    str.push("Телефон: #{@phone}") if phone
    str.push("Телеграм: #{@telegram}" ) if telegram
    str.push("Почта: #{@mail}" )if mail
    str.push("GitHub: #{@git}") if git
    str.join("\n")
  end
end