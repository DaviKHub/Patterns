class DataTable
  attr_reader :data
  private :data

  def initialize(data)
    self.data = data
  end

  def get_element(num_of_row, num_of_column)
    deep_dup(data)[num_of_row][num_of_column]
  end

  def row_count
    @data.size
  end

  def column_count
    return 0 if @data.empty?
    @data[0].size
  end

  def to_s
    column_widths = [5, 15, 30, 15]
    data = []
    @data.each do |row|
      data << row.each_with_index.map { |cell, i| cell.to_s.ljust(column_widths[i]) }.join
    end
    data.join("\n")
  end

  private def data=(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Данные должны быть в виде двумерного массива"
    end
    @data = deep_dup(data)
  end

  private def deep_dup(element)
    if element.is_a?(Array)
      element.map { |sub_element| deep_dup(sub_element) }
    else
      begin
        element.dup
      rescue
        element
      end
    end
  end
end

