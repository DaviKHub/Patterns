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

string_student_info="ID: 1234567890; Фамилия: Тестов; Имя: Тест; Отчество: Тестович; Телефон: +79123456789; Телеграм: @test; Почта: test@ya.ru; GitHub: https://github.com/test"
student2=Student.parce_from_string(string_student_info)
puts student2.validate
puts student.get_info
