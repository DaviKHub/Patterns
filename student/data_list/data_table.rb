class DataTable
  attr_reader :data
  private :data

  def initialize(data)
    self.data = data
  end

  def get_element(row, col)
    raise IndexError, "Неверный индекс строки" if row < 0 || row >= rows_count
    raise IndexError, "Неверный индекс столбца" if col < 0 || col >= columns_count

    data[row][col]
  end

  def rows_count
    @data.size
  end

  def columns_count
    return 0 if @data.empty?
    @data[0].size
  end

  private def data=(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Данные должны быть в виде двумерного массива"
    end
    @data = deep_dup(data)
  end
end

