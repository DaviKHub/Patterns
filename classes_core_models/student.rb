class Student
  attr_accessor :id, :surname, :first_name, :second_name, :telegram, :mail, :git,:phone
  def initialize(params={})
    @id=params[:id]
    @surname=params[:surname]
    @first_name=params[:first_name]
    @second_name=params[:second_name]
    @phone=params[:phone] if Student.is_phone?(params[:phone])
    @telegram=params[:telegram]
    @mail=params[:mail]
    @git=params[:git]
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
  def self.is_phone?(phone)
    phone.match?(/\A\+?\d{10,11}\z/)
  end

end