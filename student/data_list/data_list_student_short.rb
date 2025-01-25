require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort < DataList
  attr_accessor :count, :offset

  def initialize(data, offset = 0)
    super(data)
    @offset = offset
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end
  def replace_data(new_data)
    @data = new_data
  end

  def notify
    puts "Объекты для таблицы: #{get_objects_array.inspect}" # Отладка
    @observers.each do |observer|
      observer.set_table_params(get_names, @count)
      observer.set_table_data(get_objects_array)
    end
  end

  private def get_names
    ["№", "full_name", "git", "contact"]
  end

  private def get_objects_array
    puts "#{data.inspect}" # Отладка
    data.map.with_index(1) do |object, index|
      [index + @offset, object.initials, object.git, object.contact]
    end
  end
end