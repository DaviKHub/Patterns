class StudentDBAdapter < Adapter
  def initialize(db_config)
    @database = DBConfiguration.instance(db_config)
  end

  def get_by_id(id)
    @database.get_by_id(id)
  end

  def get_k_n_student_short_list(k, n)
    @database.get_k_n_student_short_list(k, n)
  end

  def add(student)
    @database.add(student)
  end

  def replace_by_id(id, new_student)
    @database.replace_by_id(id, new_student)
  end

  def remove_by_id(id)
    @database.remove_by_id(id)
  end

  def count
    @database.count
  end
end