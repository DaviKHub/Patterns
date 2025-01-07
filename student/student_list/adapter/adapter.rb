class Adapter
  def get_by_id(id)
    raise NotImplementedError
  end

  def get_k_n_student_short_list(k, n)
    raise NotImplementedError
  end

  def add(student)
    raise NotImplementedError
  end

  def replace_by_id(id, new_student)
    raise NotImplementedError
  end

  def remove_by_id(id)
    raise NotImplementedError
  end

  def count
    raise NotImplementedError
  end
end