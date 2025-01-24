require_relative 'connection'
require_relative '../../models/student'

class StudentListDB

  def initialize(config)
    @config = config
  end

  def get_student_by_id(id)
    data = @connection.execute("SELECT * FROM students WHERE id = $1", [id])
    raise "Студент с ID #{id} не найден" if data.ntuples == 0
    student = data[0].transform_keys { |key| key.to_sym }
    Student.new(**student)
  end

  def get_k_n_student_short_list(k, n)
    start = (k - 1) * n
    data = @connection.execute("SELECT * FROM students LIMIT $1 OFFSET $2", [n, start])
    data.map do |row|
      row = row.transform_keys { |key| key.to_sym }
      Student.new(**row)
    end
  end

  def add_student(student)
    query = "INSERT INTO students (surname,name,patronymic,birthdate,phone,email,telegram,git) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)"
    params = [student.surname,
              student.name,
              student.patronymic,
              student.birthdate,
              student.phone,
              student.email,
              student.telegram,
              student.git]
    @connection.execute(query, params)
  end

  def replace_student_by_id(id, student)
    query = "UPDATE students SET surname = $1, name = $2, patronymic = $3, birthdate = $4,phone = $5, email = $6, telegram = $7, git = $8 WHERE id = $9"
    params = [student.surname,
              student.name,
              student.patronymic,
              student.birthdate,
              student.phone,
              student.email,
              student.telegram,
              student.git,
              id]
    new_student = @connection.execute(query, params)
    raise "Студент с ID #{id} не найден" if new_student.cmd_tuples == 0
  end

  def delete_student_by_id(id)
    result = @connection.execute("DELETE FROM students WHERE id = $1", [id])
    raise "Студент с ID #{id} не найден" if result.cmd_tuples == 0
  end

  def count_students_short()
    count = @connection.execute("SELECT COUNT(*) FROM students")
    count[0]['count'].to_i
  end

  def read
    data = @connection.execute("SELECT * FROM students")
    data.map do |row|
      row = row.transform_keys { |key| key.to_sym }
      Student.new(**row)
    end
  end

end





