class DataList

    def initialize(data)
        self.data = data
        @selected = []
    end

    protected def data=(data)
        unless data.is_a?(Array)
			raise ArgumentError
		end
        @data = data.map { |element| deep_dup(element) }
    end

    def select(index)
        raise ArgumentError unless  index >= 0 && index < @data.size
        element = @data[index]
        @selected << element unless @selected.include?(element)
    end

    def get_selected
        deep_dup(@selected)
    end

    def get_names
        raise ArgumentError
    end

    def get_data
        res = @data.map.with_index do |element, index|
            self.make_row(index)
        end
        DataTable.new(res)
    end

    def build_row(index)
        raise ArgumentError
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

end