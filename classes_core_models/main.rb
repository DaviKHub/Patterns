require_relative 'student'
require_relative 'student_short'
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
string = "ID: 1111111111; Фамилия: Тестов; Имя: Тест; Отчество: Тестович; Телефон: +79123456789; Телеграм: @test; Почта: test@ya.ru; GitHub: https://github.com/test"
student = Student.parse_from_string(string)

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

students_1 = read_from_txt('/Users/david/Patterns_proj/classes_core_models/students.txt')
write_to_txt('/Users/david/Patterns_proj/classes_core_models/', 'students_1', students_1)
students_2 = read_from_txt('/Users/david/Patterns_proj/classes_core_models/students_1.txt')
puts students_1.join(" ") == students_2.join(" ")

string="ID: 1111111111; initials: ТестовТ.Т.; Phone: +79123456789; Telegram: @test; Mail: test@ya.ru; GitHub: https://github.com/test"
puts StudentShort.new(string)
puts StudentShort.new(student)