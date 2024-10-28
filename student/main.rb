require_relative 'student'
require_relative 'student_short'

def read_from_txt(path)
  students = []
  File.readlines(path, encoding: 'UTF-8').each do |line|
    students.push(Student.parse_from_string(line))
  end
  return students
end

def write_to_txt(path, file_name, students)
  File.open("#{path}/#{file_name}.txt", "w") do |file|
    file.write(students.join("\n"))
  end
end

# данные из хэша и проверка на валидацию
student_info = {
  id: "1987654321",
  surname: "Иванов",
  name: "Иван",
  patronymic: "Иванович",
  phone: "+7912345678",
  telegram: "@ivanov",
  mail: "ivanov@ya.ru",
  git: "https://github.com/ivanov"
}

student = Student.new(student_info)
print "#{student}, #{student.validate?}\n"

# данные из строки и проверка на валидацию
string = "ID: 1111111111; Фамилия: Тестов; Имя: Тест; Отчество: Тестович; Телефон: +79123456789; Телеграм: @test; Почта: test@ya.ru; GitHub: https://github.com/test"
student = Student.parse_from_string(string)
print "#{student}, #{student.validate?}\n"
string = "ID: 1111111111; Инициалы: ТестовТ.Т.; GitHub: https://github.com/test; Контакт: +79123456789"
student_short = StudentShort.initialize_from_string(string)
print "#{student_short}, #{student_short.validate?}\n"

# данные из студента и проверка на валидацию
student_short = StudentShort.initialize_from_student(student)
print "#{student_short}, #{student_short.validate?}\n"

# проверка совместимости чтения из файла и запись в него
students_1 = read_from_txt("student/students.txt")
write_to_txt("student", "students_1", students_1)
students_2 = read_from_txt("student/students_1.txt")
puts students_1.join == students_2.join