class DataList

  attr_reader :data
  attr_accessor :selected

  protected :data
  protected :selected

  def initialize(elements)
    self.data = elements
    self.selected = []
  end

  def select(number)
    element = self.data[number]
    if element && !self.selected.include?(element.id)
      self.selected << number
    end
  end

  def get_selected
    self.selected.dup
  end

  def get_names
    column_names
  end

  def get_data
    result = [self.get_names]
    index = 1
    selected.each do |selected_index|
      obj = self.data[selected_index]
      row = build_row(index, obj)
      result << row
      index += 1
    end
    DataTable.new(result)
  end

  protected def data=(data)
    @data = data.map { |element| deep_dup(element) }
  end

  protected def deep_dup(element)
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

  protected def column_names
    raise NotImplementedError
  end
end
