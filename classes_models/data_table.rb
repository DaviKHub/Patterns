class Data_table
  def initialize(matrix)
    self.matrix = matrix
  end

  protected def matrix=(matrix)
    raise(ArgumentError, "Data must be a matrix") unless valid_data?(matrix)
  end

  protected def valid_data?(matrix)
    matrix.is_a?(Array) && matrix.all? { |row| row.is_a?(Array) }
  end
end