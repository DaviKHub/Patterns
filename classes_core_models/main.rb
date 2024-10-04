require_relative 'student'

student_info={
  surname:"Иванов",
  first_name:"Иван",
  second_name:"Иванович",
  phone:"+79999999999",
  telegram:"@ivanov",
  mail:"ivanov@ya.ru",
  git:"https://github.com/ivanov"
}

student=Student.new(student_info)
print student