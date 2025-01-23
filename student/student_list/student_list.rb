class StudentList
  def initialize(path:, strategy:)
    @path = path
    @strategy = strategy
    @students_list = load
  end

  def load
    @strategy.load(@path)
  end

  def save
    @strategy.save(@path, @students_list)
  end

  def get_by_id(id)
    @students_list.find { |student| student.id == id }
  end

  def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    end_index = start_index + n - 1
    short_students = @students_list[start_index..end_index] || []
    return existing_data_list || DataListStudentShort.new([]) if short_students.empty?

    short_students = short_students.map { |student| StudentShort.from_student(student) }
    if existing_data_list
      existing_data_list.data = short_students
      short_students.each_with_index { |_, ind| existing_data_list.select(ind) }
      return existing_data_list
    end

    selected_list = DataListStudentShort.new(short_students)
    short_students.each_with_index { |_, ind| selected_list.select(ind) }
    selected_list
  end

  def sort_by_surname
    @students_list.sort_by!(&:initials)
  end

  def add(student)
    if @students_list.include?(student)
            raise ArgumentError
    end
    new_id = (@students_list.map(&:id).max || 0) + 1
    student.id = new_id
    @students_list << student
    save
  end

  def replace_by_id(id, updated_student)
    index = @students_list.find_index { |student| student.id == id }
    raise IndexError, "wrong id" unless index
    if @students_list.include?(updated_student)
      raise ArgumentError, 'уже существует'
    end
    @students_list[index] = updated_student
    updated_student.id = id
  end

  def remove_by_id(id)
    @students_list.reject! { |student| student.id == id }
    save
  end

  def count
    @students_list.size
  end

  def to_a
    @students_list
  end

end