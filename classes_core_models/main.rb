require_relative 'student'

student_info={
  surname:"Иванов",
  name:"Иван",
  patronymic:"Иванович",
  phone:"+7912345678",
  telegram:"@ivanov",
  mail:"ivanov@ya.ru",
}

student=Student.new(student_info)
puts student.validate #валидация не прошла (не введен гит)
student.set_contacts(git:"https://github.com/ivanov") #уточнение гита
puts student.validate #валидация прошла (все данные введены)
