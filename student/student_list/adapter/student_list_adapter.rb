class StudentListAdapter < Adapter
  def initialize(path, strategy)
    @student_list = StudentList.new(path: path, strategy: strategy)
  end

  def get_by_id(id)
    @student_list.get_by_id(id)
  end

  def get_k_n_student_short_list(k, n)
    @student_list.get_k_n_student_short_list(k, n)
  end

  def add(student)
    @student_list.add(student)
  end

  def replace_by_id(id, new_student)
    @student_list.replace_by_id(id, new_student)
  end

  def remove_by_id(id)
    @student_list.remove_by_id(id)
  end

  def count
    @student_list.count
  end
end