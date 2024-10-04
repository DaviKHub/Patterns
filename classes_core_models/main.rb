require_relative 'student'

student_info={
  surname:"Иванов",
  first_name:"Иван",
  second_name:"Иванович",
  phone:"+7", #намеренный ввод некоректного номера телефона
  telegram:"@ivanov",
  mail:"ivanov@ya.ru",
  git:"https://github.com/ivanov"
}

student=Student.new(student_info)
puts student,"\n"

student.phone="+79123456789" #ввод корректного номера телефона
puts student