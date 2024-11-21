class Data_table
  def initialize(matrix)
    self.matrix = matrix
  end

  private def matrix=(matrix)
    @matrix = matrix if valid_data?(matrix)
  end

  private def valid_data?(matrix)
    return false unless matrix.is_a?(Array) && matrix.all? { |row| row.is_a?(Array) }
    row_length = matrix.first.length
    return false unless matrix.all? { |row| row.length == row_length }
    (0...row_length).all? do |col_index|
      matrix.all? { |row| row[col_index] }
    end
  end

  def get_element(row, column)
    @matrix[row][column]
  end

  def count_rows
    @matrix[0].length
  end
  def count_columns
    @matrix.length
  end
end

data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
data_table = Data_table.new(data)
puts data_table.get_element(1, 0) # вывод 4
puts data_table.count_rows
puts data_table.count_columns
