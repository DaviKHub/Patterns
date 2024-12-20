class DataList

  private attr_reader :data
  private attr_reader :selected

  def initialize(elements)
    self.data = elements
  end

  private def data=(data)
    @data = data.map { |element| deep_dup(element) }
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

  def select(number)
    element = self.data[number]
    if element && !self.selected.include?(element.id)
      self.selected << number
    end
  end

  def get_selected
    self.selected.dup
  end

  protected def get_names
    raise NotImplementedError
  end

  protected def get_data
    raise NotImplementedError
  end

end
